class Api::BaseController < ApplicationController

  protected

  def record_in_use
    render status: 409
  end

  def record_not_found
    render status: 400
  end

  def not_authorized
    render status: 401
  end
end
