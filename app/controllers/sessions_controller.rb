class SessionsController < Devise::SessionsController
  layout 'static/application', only: [:new]

  def new
    @active = 'login'
    super
  end

  private

end
