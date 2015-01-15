class Admins::PagesController < ApplicationController
	# Check if admin is loged in.
	before_action :authenticate_admin!

	# Load admin layout
	layout 'admin'

	def index
		
	end
	
	#JSON file generator which contails all people from the Person model
	def json_query
		@names = []
		@persons = Person.all
		@persons.each do |n|
			name = n.first_name.to_s
			name += " "
			name += n.last_name.to_s
			@names.push(name)
		end
  		render json: @names
	end
end
