class Listing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
