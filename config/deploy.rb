fail_message = "\nInvalid deploy_env specified\n\tUsage: cap {command} -S deploy_env={environment}\nReview config\deploy.rb to see what environments are\ncurrently defined.\n\n"

begin ; deploy_env; rescue NameError; set :deploy_env, 'integration' end

set :user, 'laruby'
set :domain, 'larubyconf.com'
set :project, 'larc2010'

# version control config
set :scm, 'git'
set :scm_username, 'deploy'
set :scm_password, 'larubyconf'
set :repository, "git@github.com:larubyconf/site"
set :branch, "master"

set :application, "2010.larubyconf.com"

set :home_dir, "/home/#{user}"

case deploy_env
when 'prod2'
  set :application, "larubyconf"
  role :web, '173.203.199.95'
  role :app, '173.203.199.95'
when 'integration'
  set :application, "2010.#{domain}"
  role :web, domain
  role :app, domain
when 'production'
  set :application, "www.#{domain}"
  role :web, domain
  role :app, domain
else
  puts fail_message
  exit
end

set :applicationdir, "#{home_dir}/#{application}"
set :deploy_to, applicationdir


# New Relic deployment notification
after 'deploy:update', "newrelic:notice_deployment"

namespace :deploy do
  task :start do
  end
  task :stop do
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
