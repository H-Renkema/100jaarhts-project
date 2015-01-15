class Person < ActiveRecord::Base
  has_many :processed_images
  validates_presence_of :first_name, :last_name, :email
end
