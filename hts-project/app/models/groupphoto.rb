# Groupphoto model for person's grouppohotos
class Groupphoto < ActiveRecord::Base
  belongs_to :person
end
