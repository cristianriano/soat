class ApplicationController < ActionController::Base
  include Pundit
  rescue_from ActiveRecord::RecordNotUnique, with: :record_in_use
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  protect_from_forgery with: :exception
  before_action :set_locale

  protected

  def set_locale
    I18n.locale = params[:locale] || :es
  end

  def default_url_options(opts = {})
    { locale: I18n.locale }.merge(opts)
  end

  def logged_in?
    current_user != nil
  end

  def record_in_use
    flash[:danger] = "Los datos estan en uso"
    redirect_back(fallback_location: root_path)
  end

  def record_not_found
    flash[:danger] = "Lo sentimos. No se encontro la información que estas buscando"
    redirect_back(fallback_location: root_path)
  end

  def not_authorized
    flash[:danger] = "No cuentas con los permisos suficientes"
    redirect_back(fallback_location: root_path)
  end
end
