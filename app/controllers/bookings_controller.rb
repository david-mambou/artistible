class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update accept decline]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @service = Service.find(params[:service_id])
    # TODO: Prefill service (needs to be passed from the services show)
    authorize @booking
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(sanitized_params)
    @booking.user = current_user
    @booking.service = @service
    @booking.status = 0
    authorize @booking
    if @booking.save
      flash[:notice] = "New booking added"
      redirect_to bookings_path
    else
      flash.now[:error] = 'Try again'
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(sanitized_params)
      @booking.status = 0
      @booking.save
      redirect_to bookings_path
    else
      render :edit
    end
  end

  # the artist can accept or decline
  def accept
    @booking.status = 1
    @booking.save
    redirect_to bookings_path
  end

  def decline
    @booking.status = 2
    @booking.save
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def sanitized_params
    params.require("booking").permit(:start_time, :end_time, :service_id)
  end
end
