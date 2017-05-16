class PagesController < ApplicationController
  layout 'static/application'

  def home
    @active = 'home'
  end

  def contact
    @active = 'contact'
  end

  def about
    @active = 'about'
  end
end
