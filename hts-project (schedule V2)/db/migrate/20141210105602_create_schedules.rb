class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :content
      t.string :icon

      t.timestamps
    end
  end
end
