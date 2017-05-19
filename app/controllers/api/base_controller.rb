class Api::BaseController < ApplicationController
  rescue_from ActiveModel::UnknownAttributeError, with: :unknown_attribute
  # Avoid CSFR protection for API
  protect_from_forgery with: :null_session
  http_basic_authenticate_with name: ENV['API_USER'], password: ENV['API_PASSWORD']

  protected

  def record_in_use
    head :conflict
  end

  def record_not_found
    head :not_found
  end

  def not_authorized
    head :unauthorized
  end

  def unknown_attribute
    head :bad_request
  end
end
