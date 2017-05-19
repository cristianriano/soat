class Api::BaseController < ApplicationController
  rescue_from ActiveModel::UnknownAttributeError, with: :unknown_attribute
  # Avoid CSFR protection for API
  protect_from_forgery with: :null_session

  protected

  def record_in_use
    head :conflict
  end

  def record_not_found
    head :ok
  end

  def not_authorized
    head :unauthorized
  end

  def unknown_attribute
    head :bad_request
  end
end
