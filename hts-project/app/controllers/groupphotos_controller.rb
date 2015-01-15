# Class for generating and showing the generated group photo
class GroupphotosController < ApplicationController
  before_action :authenticate_user!, except: :public_index

  # Index for when user is logged in
  def index
    @groupphotos = Groupphoto.where(person_id: current_user.person_id)
  end

  # Index to show groupphoto when unique_code is in URL
  def public_index
    person = Person.where(unique_code: params[:q]).first
    if person.nil?
      redirect_to klassenfoto_path
    else
      @groupphotos = person.groupphotos
    end
  end

  # Start generation of all group photos
  def generate
    all_years = Person.where.not(unique_code: nil)
                .select(:graduation_year, :major)
                .group(:graduation_year, :major)
                .count(:graduation_year, :major)
    all_years.each do |g|
      @background = 'nhl2014'
      generate_group_photo(g)
    end
    render text: "All Photo's generated"
  end

  # Page for requesting custom group photo
  def request_one_group_photo
    @user = current_user
  end

  # POST processing for custom group photo
  def generate_one
    @user = current_user
    @background = params[:background]
    generate_group_photo(user, true)
  end

  ##################################
  #   BEGIN PRIVATE LOGIC BLOCK    #
  ##################################

  private

  # Generate a group photo for a specific major group
  def generate_group_photo(user, single:false)
    counter = 0
    @people_list = []
    # Find all people from a specific year and major
    people = Person.where(graduation_year: user.first.first)
             .where(major: user.first.second).where.not(unique_code: '')
    people_per_row = 3 # How many people per row are allowed
    rows = (people.count / people_per_row).ceil # Calculate amount of rows
    # Add each person's keyed image to the the processing array below
    people.each.next do |p|
      unless p.processed_images.first.nil?
        @people_list.push(
          MiniMagick::Image.open(
              "#{Rails.root}/public#{p.processed_images.first.file_name.url}"))
      end
    end
    # Select the background from the submitted value and open in imagemagick
    image = MiniMagick::Image.new(
        "#{Rails.root}/public/backgrounds/#{@background}.png")
    # Add each person to the photo
    @people_list.each do |p|
      # Calculate picture movement on x-axis below
      xmove = counter % (people_per_row) * 300
      # Composite image with current image and new photo
      image = image.composite(p, 'png') do |e|
        e.gravity 'SouthWest'
        e.geometry("100%x100%+#{xmove}+#{rows * 350}")
      end
      # Add to counter to increase indent
      counter += 1
      rows -= 1 if rows == 0
    end
    image.format 'png' # make sure the image is PNG
    # Check for / in major name and replace with 'of'
    if user.first.second.include? '/'
      major = user.first.second.gsub!('/', 'of')
    else
      major = user.first.second
    end
    # Check if generating for one user and change filename accordingly
    if single
      filename = "/groupphoto/#{@user.unique_code}.png"
    else
      filename = "/groupphoto/#{user.first.first}_#{major}.png"
    end
    # Write image to folder below
    image.write("#{Rails.root}/public#{filename}")
    # Write filename to database for either one or group users below
    if single
      add_groupphoto_to_user(filename, @user)
    else
      add_groupphoto_to_users(filename, people)
    end
  end

  def add_groupphoto_to_users(filename, people_list)
    people_list.each do |person|
      add_groupphoto_to_user(filename, person)
    end
  end

  def add_groupphoto_to_user(filename, person)
    photo = Groupphoto.new
    photo.file_name = filename
    photo.person_id = person.id
    photo.save
  end
end
