class Admins::PhotoalbumsController < ApplicationController
	# Check if admin is loged in.
	before_action :authenticate_admin!

	# Load admin layout
	layout 'admin'


	# Simple CRUD system which can display, create, update and delete items, with strong paramaters.

	def index
		@photoalbums = Photoalbum.all
		@photoalbums = Photoalbum.order(created_at: :desc)
	end

	def show
		begin
			photoalbum = Photoalbum.find(params[:id])
			@photoalbum = photoalbum.photos.paginate(:page => params[:page], :per_page => 6)
			@newphoto = Photoalbum.find(params[:id])
		rescue ActiveRecord::RecordNotFound #in case the record is not found redirect to the index path
			redirect_to admins_photoalbums_path
		end
	end
	
	def new
		@photoalbum = Photoalbum.new
	end

	def create
		photoalbum = Photoalbum.new(photoalbum_params)
		if photoalbum.save
			redirect_to admins_photoalbums_path
			flash[:notice] = "Fotoalbum succesvol aangemaakt"
		else
			redirect_to new_admins_photoalbum_path

			photoalbum.errors.messages.each do |c|
				flash[:alert] = c[1].first
			end		
		end

	end

	def edit
		@photoalbum = Photoalbum.find(params[:id])
	end

	def update
		@photoalbum = Photoalbum.find(params[:id])
		@photoalbum.update(photoalbum_params)
		if @photoalbum.save
			redirect_to admins_photoalbums_path
			flash[:notice] = "Fotoalbum succesvol aangepast"
		else
			redirect_to edit_admins_photoalbum_path(params[:id])
			
			@photoalbum.errors.messages.each do |c|
				flash[:alert] = c[1].first
			end		
		end
	end

	def destroy
		@photoalbum = Photoalbum.find(params[:id])
		#Also delete al photos in the album.
		@photoalbum.photos.each do |c|
			c.destroy
		end

		@photoalbum.destroy
		redirect_to admins_photoalbums_path
	end

	private

	 def photoalbum_params
	 	params.require(:photoalbum).permit(:name)
	 end
end
