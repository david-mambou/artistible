class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update delete_photo destroy]

  def index
    @services = policy_scope(Service)
  end

  def show
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(sanitized_params)
    @service.user = current_user
    authorize @service
    if @service.save
      flash[:notice] = 'New service added'
      redirect_to bookings_path
    else
      flash.now[:error] = 'Invalid parameters. Try again'
      render :new
    end
  end

  def edit
  end

  def update
    if @service.update(sanitized_params)
      flash[:notice] = 'New service added'
      redirect_to bookings_path
    else
      flash.now[:error] = 'Invalid parameters. Try again'
      render :edit
    end
  end

  def destroy
    @service.destroy
  end

  def delete_photo
    # not working
    # @service.photos.delete_at(params[:index])
    # @service.save
  end

  private

  def sanitized_params
    params.require("service").permit(:price, :title, :description, :category, photos: [])
  end

  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end
end
