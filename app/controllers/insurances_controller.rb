class InsurancesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_gon, only: [:new]

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
    @insurance.calculate_expiration
    if @insurance.save
      mail = UsersMailer.purchase_summary(current_user, @insurance)
      ENV['SIDEKIQ_MAILER'] == 'true' ? mail.deliver_later : mail.deliver_now
      flash[:success] = "Felicitaciones! Ha adquirido el seguro SOAT. Ahora se encuentra protegido hasta #{@insurance.ends_at.strftime('%d %b %Y')}"
      redirect_to insurance_path(@insurance)
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
    @insurance = Insurance.includes(:vehicle).includes(:rate).find(params[:id])
    authorize @insurance
    @vehicle = @insurance.vehicle
    @rate = @insurance.rate
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InsurancePdf.new({insurance: @insurance, rate: @rate, vehicle: @vehicle, view: view_context})
        send_data pdf.render, filename: "#{@vehicle.license}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def bought
    @active = 'bought'
    @insurances = Insurance.joins(:vehicle).includes(:rate).includes(:user).where(vehicles: {user_id: current_user.id}).paginate(page: params[:page])
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
