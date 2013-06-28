load 'deploy'
# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
set :asset_env, "#{asset_env} RAILS_RELATIVE_URL_ROOT=/var/railsapps"
load 'config/deploy' # remove this line to skip loading any of the default tasks