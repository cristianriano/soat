class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_values, only: [:search]

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
    if @vehicle.save
      @rate = @vehicle.rate
      flash[:success] = "Vehiculo registrado"
    else
      flash[:danger] = "No se pudo registrar"
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def index
    authorize Vehicle
    @vehicles = Vehicle.includes(:user).includes(:rate).paginate(page: params[:page])
  end

  def show
    @vehicle = Vehicle.includes(:rate).includes(:user).find(params[:id])
    authorize @vehicle
    @user = @vehicle.user
    @rate = @vehicle.rate
  end

  def search
    query = Vehicle.where(search_params)
    query = query.where(user_id: current_user.id) unless current_user.admin?
    @vehicle = query.includes(:insurances).first
    unless @vehicle.nil?
      authorize @vehicle
      @rate = @vehicle.rate
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  protected

  def vehicle_params
    params.require(:vehicle).permit(:license, :category, :subcategory, :age, :value, :value_type)
  end

  def search_params
    search_params = params.require(:vehicle).permit(:license)
    search_params.each{|k,v| params[k] = v.upcase! }
  end

  def load_values
    @category = Vehicle::CATEGORIES.first
    @subcategories = Vehicle::SUBCATEGORIES_HASH[@category]
    @value_type = Vehicle::VALUE_TYPES_HASH[@category]
  end
end
