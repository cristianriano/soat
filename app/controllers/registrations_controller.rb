class RegistrationsController < Devise::RegistrationsController
  layout 'static/application', only: [:new, :create]

  def new
    @active = 'register'
    super
  end

  def create
    @active = 'register'
    super
  end

  def edit
    @active = 'profile'
    super
  end

  def update
    @active = 'profile'
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname, :document, :document_type, :phone)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :lastname, :document, :document_type, :phone)
  end
end
