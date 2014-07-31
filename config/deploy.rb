require "rvm/capistrano"
require "bundler/capistrano"

set :application, "edas"
set :domain, "edas@146.185.186.136" 
set :shared_children, shared_children  
set :repository,  "https://github.com/PawelShi/edas-site.git"
set :deploy_to, "/var/www/edas-site"
set :scm, :git
set :branch, "master"
set :user, "edas"
set :group, "www-data"
set :use_sudo, false
set :rails_env, "development"#"production"#test/development/production
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 22 }
set :keep_releases, 5
set :rvm_type, :system

# role :web, domain
# role :app, domain
# role :db,  domain, :primary => true

default_run_options[:pty] = true
server "146.185.186.136", :app, :web, :db, :primary => true

after "deploy", "deploy:cleanup"

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
    put File.read("config/production_database.yml"), "#{shared_path}/config/database.yml"
    puts "Теперь вы можете отредактировать файлы в  #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    sudo "chmod 777 #{release_path}/config/unicorn_init.sh"
    sudo "dos2unix #{release_path}/config/unicorn_init.sh"
    sudo "chmod 777 /etc/init.d/unicorn_#{application}"
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


# set :repository,  "set your repository location here"

# # set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"

# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts

# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end