class SessionsController < Devise::SessionsController
  layout 'static/application', only: [:new]

  def new
    super
    @active = 'login'
  end

  private

end
