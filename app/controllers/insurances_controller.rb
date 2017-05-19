class InsurancesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_gon, only: [:new]

  def new
    @active = 'buy'
    @vehicle = Vehicle.new
    @insurance = Insurance.new
    # Preselected values
    @category = Vehicle::CATEGORIES.first
    @subcategories = Vehicle::SUBCATEGORIES_HASH[@category]
    @value_type = Vehicle::VALUE_TYPES_HASH[@category]
  end

  def create

  end

  def index
  end

  def show
  end

  protected

  def insurance_params
    params.require(:insurance).permit(:vehicle_id)
  end

  def load_gon
    gon.subcategories_hash = Vehicle::SUBCATEGORIES_HASH
    gon.value_types_hash = Vehicle::VALUE_TYPES_HASH
  end
end
