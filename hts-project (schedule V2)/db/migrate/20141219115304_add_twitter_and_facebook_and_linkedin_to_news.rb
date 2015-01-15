class AddTwitterAndFacebookAndLinkedinToNews < ActiveRecord::Migration
  def change
    add_column :news, :twitter, :string
    add_column :news, :facebook, :string
    add_column :news, :linkedin, :string
  end
end
