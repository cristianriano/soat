class Api::V1::VehiclesController < Api::BaseController

  def create
    binding.pry
    @vehicle = Vechile.new(vehicle_params)
    if @vehicle.save
      render status: 201, template: 'api/v1/vehicles/show'
    else
      render status: 400, json: @vehicle.errors.messages.to_json
    end
  end

  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:license, :category, :subcategory, :age, :value, :value_type, :user_id)
  end
end
