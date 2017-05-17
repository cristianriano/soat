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

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
