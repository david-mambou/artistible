class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(sanitized_params)
    @review.booking = params[:booking] # not entirely sure
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

  def sanitizen_params
    params.require(:review).permit(:rating, :comment)
  end
end
