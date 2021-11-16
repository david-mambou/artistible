class BookingsController < ApplicationController
  before_action :set_booking, only: %i[accept decline]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
  end

  def create
  end

  # the customer can edit
  def edit
  end

  def update
  end

  # the artist can accept or decline
  def accept
    @booking.status = 1
    # redirect_to bookings_path ?
  end

  def decline
    @booking.status = 2
    # redirect_to bookings_path ?
  end

  private

  def set_booking
    @booking = Booking.find(params_id)
    authorize @booking
  end
end
