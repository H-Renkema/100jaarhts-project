class AddTitleAndSpeakerAndLocationToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :title, :string
    add_column :schedules, :speaker, :string
    add_column :schedules, :location, :string
  end
end
