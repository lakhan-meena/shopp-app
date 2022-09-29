class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :mobile_number, presence: true
  validates :mobile_number, length: {minimum: 10, maximum: 10}, allow_blank: true
  has_one :cart
end
