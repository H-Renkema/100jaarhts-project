# Photoalbum model
class Photoalbum < ActiveRecord::Base
  has_many :photos
end
