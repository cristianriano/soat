class PagesController < ApplicationController
  layout 'static/application'

  before_action :redirect_to_dashboard

  def home
    @active = 'home'
  end

  def contact
    @active = 'contact'
  end

  def about
    @active = 'about'
  end

  private

  def redirect_to_dashboard
    redirect_to :dashboard if logged_in?
  end
end
