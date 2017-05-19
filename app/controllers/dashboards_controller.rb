class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @active = 'dashboard'
  end
end
