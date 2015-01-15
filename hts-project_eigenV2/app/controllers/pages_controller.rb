class PagesController < ApplicationController

	def index
		@photo = Photo.where(:featured => true)
	end
end
