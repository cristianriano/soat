if Rails.env.production?
  ActionMailer::Base.default_url_options = {host: (ENV['HOSTNAME'] || 'localhost'), protocol: (ENV['PROTOCOL'] || 'http')}

  ActionMailer::Base.smtp_settings = {
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD`'],
    domain: ENV['HOSTNAME'],
    address: "smtp.sendgrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
