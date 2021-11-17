class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, through: :bookings

  CATEGORIES = ['murals', 'paintings', 'interior', 'illustrations', 'signwriting'].freeze
  validates :category, inclusion: { in: CATEGORIES }
end
