# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'myrailsblogpw'
set :repo_url, 'https://github.com/bobanuk/myrailsblogpw.git'
set :deploy_to, '/var/www/myrailsblogpw'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :format, :pretty
set :log_level, :info
set :branch, 'master'
set :format, :pretty



namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
