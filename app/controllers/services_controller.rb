class ServicesController < ApplicationController
  def index
    @services = policy_scope(Service)
    authorize @services
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
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
