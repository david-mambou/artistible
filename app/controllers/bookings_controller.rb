class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
