class Product < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images

  mount_uploader :main_photo, PhotoUploader

end
