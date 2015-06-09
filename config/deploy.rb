# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'myrailsblogpw'
set :repo_url, 'https://github.com/bobanuk/myrailsblogpw.git'
set :deploy_to, '/var/www/myrailsblogpw'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :format, :pretty
set :log_level, :info
set :stage, :production
set :branch, 'master'
set :format, :pretty
set :rails_env, :production
set :scm, :git
set :keep_releases, 3




namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end

  desc "Sync the public/assets directory."
  task :assets do
    system "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{application}:#{shared_path}/"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
