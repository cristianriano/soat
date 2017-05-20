module AuthHelper
  def http_login
    user = ENV['API_USER']
    password = ENV['API_PASSWORD']
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  end
end
