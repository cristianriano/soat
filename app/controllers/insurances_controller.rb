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
    @insurance = Insurance.new(insurance_params)
    @vehicle = Vehicle.find(insurance_params[:vehicle_id])
    @insurance.rate_id = @vehicle.rate_id
    authorize @insurance
    # Set times
    @insurance.starts_at = @vehicle.next_insurance_start
    @insurance.ends_at = @insurance.starts_at + 1.year
    if @insurance.save
      flash[:success] = "Felicitaciones! Ha adquirido el seguro SOAT. Ahora se encuentra protegido hasta #{@insurance.ends_at.strftime('%d %b %Y')}"
      redirect_to root_path
    else
      flash[:danger] = "No se pudo comprar. Verifica tus datos"
      render 'new'
    end
  end

  def index
    authorize Insurance
    @insurances = Insurance.includes(:vehicle).includes(:rate).includes(:user).paginate(page: params[:page])
  end

  def show
    authorize @insurance
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
