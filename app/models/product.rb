class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :code, :title, :price, presence: true
  validates_uniqueness_of :code
  has_many :items, dependent: :destroy
  has_many :orders, through: :items
  belongs_to :category
end
