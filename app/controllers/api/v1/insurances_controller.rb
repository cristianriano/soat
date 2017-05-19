class Api::V1::InsurancesController < Api::BaseController

  def create
    @insurance = Insurance.new(insurance_params)
    @vehicle = Vehicle.find(insurance_params[:vehicle_id])
    @insurance.rate_id = @vehicle.rate_id
    @insurance.calculate_expiration
    if @insurance.save
      render status: 201, template: 'api/v1/insurances/show'
    else
      render status: 400, json: @insurance.errors.messages.to_json
    end
  end

  def index
    @insurances = Insurance.includes(:vehicle).includes(:rate).all
  end

  def show
    @insurance = Insurance.includes(:vehicle).includes(:rate).find(params[:id])
  end

  # Insurances should not be edited
  # def update
  #   @insurance = Insurance.update(params[:id], insurance_params)
  #   render status: 200, template: 'api/v1/insurances/show'
  # end

  def insurance
    @insurance = Insurance.find(params[:id]).destroy
    render status: 200, template: 'api/v1/insurances/show'
  end

  private

  def insurance_params
    params.require(:insurance).permit(:vehicle_id)
  end
end
