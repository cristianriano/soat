class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  protected

  def set_locale
    I18n.locale = params[:locale] || :es
  end
end
