class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit]

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
      redirect_to bookings_path # change to the artist dashboard
    else
      flash.now[:error] = 'Invalid parameters. Try again'
      render :new
    end
  end

  def edit
  end

  def update
    if @service.update(sanitizen_params)
      flash[:notice] = 'New service added'
      redirect_to bookings_path # change to the artist dashboard
    else
      flash.now[:error] = 'Invalid parameters. Try again'
      render :edit
    end
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
