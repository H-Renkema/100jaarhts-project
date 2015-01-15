# Rails model for News content
class News < ActiveRecord::Base
  mount_uploader :image, NewsUploader
end
