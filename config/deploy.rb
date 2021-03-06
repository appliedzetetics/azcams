require 'capistrano/ext/multistage'
require "bundler/capistrano" 

set :stages, [ "production"]
set :default_stage, "production"

set :application, "azcams"
set :repository, "git@github.com:appliedzetetics/azcams.git"
set :deploy_to, "/var/railsapps/azcams"
set :deploy_via, :remote_cache
set :scm, "git"
set :branch, "master"

set :use_sudo, false

default_run_options[:pty] = true  # Must be set for the password prompt

set :default_environment, {
  'PATH' => "$HOME/.rvm/bin:$PATH"
}

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "vds"                          # Your HTTP server, Apache/etc
role :app, "vds"                          # This may be the same as your `Web` server
role :db,  "vds", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

after 'deploy:update_code', 'deploy:migrate'

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup" 

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

