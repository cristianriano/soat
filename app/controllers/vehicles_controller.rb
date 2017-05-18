class VehiclesController < ApplicationController
  before_filter :authenticate_user!, except: [:search]

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def search
    @vehicle = Vehicle.where(search_params)
    respond_to do |format|
      format.js
      format.html
    end
  end

  protected

  def vehicle_params
    params.require(:vehicle).permit(:license)
  end

  def search_params
    params.require(:vehicle).permit(:license)
  end
end
