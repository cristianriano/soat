class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @active = 'dashboard'
  end
end
