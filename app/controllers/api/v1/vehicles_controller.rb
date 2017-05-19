class Api::V1::VehiclesController < Api::BaseController

  def create
    @vehicle = Vehicle.new(vehicle_params)
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

  def update
    @vehicle = Vehicle.update(params[:id], vehicle_params)
    render status: 200, template: 'api/v1/vehicles/show'
  end

  def destroy
    @vehicle = Vehicle.find(params[:id]).destroy
    render status: 200, template: 'api/v1/vehicles/show'
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:license, :category, :subcategory, :age, :value, :value_type, :user_id)
  end
end
