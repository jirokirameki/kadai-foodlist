class Post < ApplicationRecord
  # mount_uploader :image, ImageUploader
  belongs_to :restaurant
end
