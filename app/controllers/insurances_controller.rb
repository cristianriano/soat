class InsurancesController < ApplicationController
  def new
    @active = 'buy'
    @vehicle = Vehicle.new
    @subcategories = Vehicle::SUBCATEGORIES
    @insurance = Insurance.new
  end

  def create
  end

  def index
  end

  def show
  end

  protected

  def insurance_params
  end

  def vehicle_params
  end
end
