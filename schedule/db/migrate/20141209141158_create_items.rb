class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :time
      t.text :content

      t.timestamps
    end
  end
end
