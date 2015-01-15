class Admins::SchedulesController < ApplicationController
	
	before_action :authenticate_admin!

	layout 'admin'

	def index
		@schedules = Schedule.all.order(start_time: :asc)
	end

	def show
		@schedule = Schedule.find(params[:id])
	end

	def new
		@schedule = Schedule.new
	end

	def create
		@schedule = Schedule.new(schedule_params)

		if @schedule.save
			redirect_to admins_schedules_path
			flash[:notice] = "Schema-item toegevoegd"
		else
			redirect_to new_admins_schedule_path

			@schedule.errors.messages.each do |c|
				flash[:alert] = c[1].first
			end
		end
	end

	def edit
		@schedule = Schedule.find(params[:id])
	end

	def update
		@schedule = Schedule.find(params[:id])

		if @schedule.update_attributes(schedule_params)
			redirect_to admins_schedules_path
			flash[:notice] = "Schema-item updated"
			
		else
			edit_admins_schedule_path

			@schedule.errors.messages.each do |c|
				flash[:alert] = c[1].first
			end
		end
	end

	def destroy
		@schedule = Schedule.find(params[:id])
		@schedule.destroy

		redirect_to admins_schedules_path, :notice => "Schema-item verwijderd"
	end

	private

	def schedule_params
		params.require(:schedule).permit(:start_time, 
																		 :end_time, 
																		 :content, 
																		 :icon, 
																		 :title, 
																		 :location, 
																		 :speaker)
	end
end