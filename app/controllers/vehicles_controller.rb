class VehiclesController < ApplicationController
  before_filter :authenticate_user!, except: [:search]

  def new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
    if @vehicle.save
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
  end

  def show
  end

  def search
    @vehicle = Vehicle.where(search_params).first
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
end
