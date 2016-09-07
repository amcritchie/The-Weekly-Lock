require "bundler/capistrano"

server "192.241.221.175", :web, :app, :db, primary: true

set :application, "the_weekly_lock"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:amcritchie/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end

# namespace :deploy do
#   desc "reload the database with seed data"
#   # rake db:drop db:create db:migrate db:seed
#
#   task :full do
#     run "cd #{current_path}; bundle exec rake db:reset RAILS_ENV=#{rails_env}"
#     run "cd #{current_path}; bundle exec rake db:create RAILS_ENV=#{rails_env}"
#     run "cd #{current_path}; bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
#     run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
#   end
#   task :seed do
#     run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
#   end
# end

# namespace :deploy do
#   namespace :assets do
#
#     task :precompile, :roles => :web do
#       from = source.next_revision(current_revision)
#       if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
#         run_locally("RAILS_ENV=#{rails_env} rake assets:clean && RAILS_ENV=#{rails_env} rake assets:precompile")
#         run_locally "cd public && tar -jcf assets.tar.bz2 assets"
#         top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
#         run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
#         run_locally "rm public/assets.tar.bz2"
#         run_locally("rake assets:clean")
#       else
#         logger.info "Skipping asset precompilation because there were no asset changes"
#       end
#     end
#
#     task :symlink, roles: :web do
#       run ("rm -rf #{latest_release}/public/assets &&
#       mkdir -p #{latest_release}/public &&
#       mkdir -p #{shared_path}/assets &&
#       ln -s #{shared_path}/assets #{latest_release}/public/assets")
#     end
#   end
#
#   # other stuff...
#   # namespace :rake do
#   #   namespace :db do
#   #     %w[create migrate reset rollback seed setup].each do |command|
#   #       desc "Rake db:#{command}"
#   #       task command, roles: :app, except: {no_release: true} do
#   #         run "cd #{deploy_to}/current"
#   #         run "bundle exec rake db:#{ENV['task']} RAILS_ENV=#{rails_env}"
#   #       end
#   #     end
#   #   end
#   #   namespace :assets do
#   #     %w[precompile clean].each do |command|
#   #       desc "Rake assets:#{command}"
#   #       task command, roles: :app, except: {no_release: true} do
#   #         run "cd #{deploy_to}/current"
#   #         run "bundle exec rake assets:#{ENV['task']} RAILS_ENV=#{rails_env}"
#   #       end
#   #     end
#   #   end
#   # end
#
# end
