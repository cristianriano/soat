class SessionsController < Devise::SessionsController
  layout 'static/application', only: [:new, :create]

  def new
    @active = 'login'
    super
  end

  def create
    @active = 'login'
    super
  end

  private

end
