class RegistrationsController < Devise::RegistrationsController
  layout 'static/application', only: [:new]

  def new
    super
    @active = 'register'
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
