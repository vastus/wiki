num_procs = Integer(ENV["WEB_CONCURRENCY"] || 2)
num_threads = Integer(ENV["MAX_THREADS"] || 4)
env = ENV["RACK_ENV"] || "development"
port = ENV['PORT'] || 3000

workers(num_procs)
threads(num_threads, num_threads)

preload_app!

rackup(DefaultRackup)
port(port)
environment(env)

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

