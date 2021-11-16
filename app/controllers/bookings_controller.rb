class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    p current_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(sanitized_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      flash[:notice] = "New booking added"
      redirect_to root_path
    else
      flash.now[:error] = 'Try again'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def sanitized_params
    params.require("booking").permit(:start_time, :end_time, :service_id)
  end
end
