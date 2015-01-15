class Item < ActiveRecord::Base
	validates :time, :content, :presence => true
end
