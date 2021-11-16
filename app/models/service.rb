class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  CATEGORIES = ['murals', 'paintings', 'interior', 'illustrations', 'signwriting']
  validates :category, inclusion: { in: CATEGORIES }
end
