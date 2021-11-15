class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  enum status: { pending: 0, accepted: 1, declined: 2, archived: 3 }
end
