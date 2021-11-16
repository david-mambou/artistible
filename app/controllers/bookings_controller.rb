class BookingsController < ApplicationController
  before_action :set_booking, only: %i[accept decline]

  def index
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def new
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

  def sanitized_params
    params.require("booking").permit(:start_time, :end_time, :service_id)
  end
end
