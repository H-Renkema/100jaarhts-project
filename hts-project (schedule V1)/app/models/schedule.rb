class Schedule < ActiveRecord::Base
	validates_presence_of :content, message: 'Content veld is leeg!'
	validates_presence_of :icon, message: 'Geen icoon toegevoegd!'
  validates_presence_of :title, message: 'Geen titel toegevoegd!'
end