class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :code, :title, :price, presence: true
  validates_uniqueness_of :code

  belongs_to :category
end
