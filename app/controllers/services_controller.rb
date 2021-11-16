class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    p current_user
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(sanitized_params)
    @service.user = current_user
    authorize @service
    if @service.save
      flash[:notice] = "New service added"
      redirect_to root_path
    else
      flash.now[:error] = 'Try again'
      render :new
    end
  end

  private

  def sanitized_params
    params.require("service").permit(:price, :title, :description, :category)
  end
end
