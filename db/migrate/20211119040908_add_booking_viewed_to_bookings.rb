class AddBookingViewedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_viewed, :boolean, default: false
  end
end
