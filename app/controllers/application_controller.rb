class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotUnique, with: :record_in_use
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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
    redirect_to :back
  end

  def record_not_found
    flash[:danger] = "Lo sentimos. No se encontro la información que estas buscando"
    redirect_to :back
  end
end
