class ReviewsController < ApplicationController
  def new
    @booking = Booking.where(id: params[:booking_id]).first
    @review = Review.new(booking: @booking)
    authorize @review
  end

  def create
    @booking = Booking.where(id: params[:booking_id]).first
    @review = Review.new(sanitized_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to service_path(@review.service)
    else
      render :new
    end
  end

  def edit
    @review = Review.where(id: params[:id])
    authorize @review
  end

  def update
    if @review.update(sanitized_params)
      redirect_to service_path(@review.service)
    else
      render :edit
    end
  end

  def delete
    @review = Review.where(id: params[:id])
    authorize @review
    @review.destroy
  end

  private

  def sanitized_params
    params.require(:review).permit(:rating, :comment)
  end
end
