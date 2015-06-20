# config valid only for current version of Capistrano
lock("3.4.0")

set(:application, "wiki")
set(:repo_url, "https://github.com/vastus/wiki.git")

# Default deploy_to directory is /var/www/my_app_name
set(:deploy_to, "/apps/#{fetch(:application)}")

# Default value for :pty is false
# set :pty, true

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set(:linked_files, fetch(:linked_files, []).push("config/env.yml"))

# Default value for default_env is {}
set(:default_env, {:SECRET_KEY_BASE => "reijoernoseija"})

# rbenv
set(:rbenv_type, :user)
set(:rbenv_ruby, "2.2.0")
set(:rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec")
set(:rbenv_map_bins, %w(rake gem bundle ruby rails))
set(:rbenv_roles, :all) # default value

# puma
set(:puma_conf, "#{shared_path}/config/puma.rb")
set(:puma_state, "/tmp/puma.state")
set(:puma_pid, "/tmp/puma.pid")
set(:puma_default_control_app, "unix:///tmp/puma.wiki.sock")
set(:puma_init_active_record, true)

namespace :db do
  desc "Creates the database"
  task :create do
    on roles(:db) do
      within release_path do
        with :rails_env => fetch(:rails_env) do
          execute(:rake, "db:create")
        end
      end
    end
  end
end
before("deploy:migrate", "db:create")


namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

