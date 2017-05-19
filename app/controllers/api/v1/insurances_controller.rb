class Api::V1::InsurancesController < Api::BaseController

  def index
    @insurances = Insurance.includes(:vehicle).includes(:rate).all 
  end

  def show
    @insurance = Insurance.includes(:vehicle).includes(:rate).find(params[:id])
  end
end
