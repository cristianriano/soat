workers Integer(ENV['WEB_WORKERS'] || 2)
# Time it waits for the connection to ends. In development increase for pry
worker_timeout Integer(ENV['WORKER_TIMEOUT'] || 30)
max_threads = Integer(ENV['MAX_THREADS'] || 8)
min_threads = Integer(ENV['MIN_THREADS'] || 8)
threads min_threads, max_threads

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'production'

on_worker_boot do
  ActiveRecord::Base.establish_connection
  Rails.cache.reconnect if Rails.cache.respond_to? :reconnect
end
