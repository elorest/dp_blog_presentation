set :application, 'passenger'
set :repo_url, 'git@github.com:isaacsloan/dp_blog_presentation.git'

set :branch, :master

set :deploy_to, '~/www/passenger'
set :scm, :git

set :format, :pretty
set :linked_dirs, %w{log tmp pids sockets vendor/bundle public/system public/uploads}
# set :log_level, :info
set :log_level, :info
set :rails_env, "production"
# set :pty, true

# set :linked_files, %w{config/database.yml}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, "deploy:restart"
  after :finishing, 'deploy:cleanup'
end

namespace :db do
  task :full_reset do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec rake db:full_reset"
        end
      end
    end
  end
end

namespace :logs do
  desc "tail rails logs"
  task :tail do
    ################################################################################
    # Sets log level to debug so we can see program output
    ################################################################################
    set :log_level, :debug
    configure_backend

    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end
end
