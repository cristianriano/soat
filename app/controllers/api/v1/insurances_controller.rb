class Api::V1::InsurancesController < Api::BaseController

  def index

  end

  def show
    @insurance = Insurance.includes(:vehicle).includes(:rate).find(params[:id])
  end
end
