class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :services
  has_many :bookings
  has_many :bookings_as_owner, through: :services, source: :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  has_many :services_as_customer, through: :bookings, source: :service
  has_many :reviews_from_others, through: :services, source: :reviews

  def average_rating
    if reviews_from_others.any?
      reviews_from_others.average(:rating).round
    else
      "-"
    end
  end
end
