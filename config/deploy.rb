# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"
# load 'lib/capistrano/tasks/seed'

# server '45.33.124.87', roles: [:web, :app, :db], primary: true
server '162.216.17.244', user: 'mr7elmi', roles: [:web, :app, :db], primary: true

set :user, 'mr7elmi'
set :application, 'fish_market'
set :repo_url, "git@github.com:mr7elmi/fish_market.git"
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.5.1'
set :console_env, :production
set :console_user, 'mr7elmi'
set :console_shell, '/bin/bash'
# set :rbenv_path, '/home/mr7elmi/.rbenv/'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
append :rbenv_map_bins, 'puma', 'pumactl'
set :rbenv_roles, :all # default value
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/fish_market"
set :puma_threads,    [4, 16]
set :puma_workers,    4

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { user: 'mr7elmi'}
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w{.env}
# set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/assets}
set :linked_dirs, fetch(:linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}).push()
namespace :tail do
  desc "tail rails logs" 
  task :rails do
    on roles(:app) do
      execute "tail -f /home/#{fetch(:user)}/apps/#{fetch(:application)}/current/log/#{fetch(:rails_env)}.log"
    end
  end
end

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
	desc "reload the database with seed data"
  task :seed do
	  puts "\n=== Seeding Database ===\n"
	  on primary :db do
	  within current_path do
	    with rails_env: fetch(:stage) do
	      execute :rake, 'db:seed'
	    end
	  end
	 end
	end

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  # before :compile_assets, :migrate
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  # after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
