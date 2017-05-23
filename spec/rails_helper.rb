ENV['RAILS_ENV'] ||= 'test'

def zeus_running?
  File.exist? '.zeus.sock'
end

# unless zeus_running?
#   puts "Starting simplecov..."
#   require 'simplecov'
#   SimpleCov.start 'rails' do
#     add_filter '/config/'
#     add_filter '/db/'
#     add_filter '/vendor/bundle/'
#   end
# end

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require "capybara/rails"
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'factory_girl'
require 'sidekiq/testing'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# Sidekiq in testing mode fake (pushe jobs to an array)
Sidekiq::Testing.fake!

# To avoid show UTF-8 warning
Prawn::Font::AFM.hide_m17n_warning = true

#
# Configure Capybara
#
Capybara.default_host = 'http://127.0.0.1'

Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: true,
    timeout: 30,
    window_size: [1366, 768]
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

# Use this dirver for debugging js
# Insert `page.driver.debug` into your tests to pause the test and launch a browser which gives you the WebKit inspector
# to view your test run with.
# Capybara.register_driver :poltergeist_debug do |app|
#   Capybara::Poltergeist::Driver.new(app, inspector: true, debug: true)
# end

Capybara.always_include_port = true
Capybara.default_max_wait_time = 5
Capybara.javascript_driver = :poltergeist
# Capybara.javascript_driver = :poltergeist_debug

#
# Configure RSpec
#
RSpec.configure do |config|
  config.include Capybara::DSL

  # Include devise test helpers in controller specs
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  # Include login_as and logout helper
  config.include Warden::Test::Helpers

  # Factory Girl methods
  config.include FactoryGirl::Syntax::Methods

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # For feature specs using a Capybara driver for an external JavaScript-capable browser (almost all drivers)
  # like PhantomJS, the app under test and the specs do not share a database connection.
  # So do not use transaction
  config.use_transactional_fixtures = false

  # DatabaseCleaner config
  static_info_tables = %w(rates coverages)

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation, { except: static_info_tables }
    DatabaseCleaner.clean
    Sidekiq::Worker.clear_all
    Rails.application.load_seed # Load seed for static tables
    Warden.test_mode!
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation, { except: static_info_tables }

    DatabaseCleaner.clean
    DatabaseCleaner.start
    Sidekiq::Worker.clear_all
  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  # config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include WaitForAjax, type: :feature
end
