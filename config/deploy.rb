set :application, "TyLovesCandy"
set :repository,  "https://github.com/zTristan/TyLovesCandy.git"
set :deploy_to, "/var/www/#{application}"
set :user, "tristan"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false

set :stages, %w(production)
set :default_stage, :production

role :web, "tylovescandy.com"                          # Your HTTP server, Apache/etc
role :app, "tylovescandy.com"                          # This may be the same as your `Web` server
role :db,  "tylovescandy.com", :primary => true # This is where Rails migrations will run
role :db,  "tylovescandy.com"

after "deploy:update", "deploy:cleanup"
after "deploy", "config:symlink"

namespace :deploy do
  
  task :start do
    
  end
  
  task :stop do
    
  end

  desc "Restart the servers"
  task :restart, :roles => :app do
    
    # Reduce the number of workers by 10
    run "for run in {1..10}; do kill -TTOU `cat #{File.join(shared_path,'pids','unicorn.pid')}`; done"

    # Start new workers
    run "kill -USR2 `cat #{File.join(shared_path,'pids','unicorn.pid')}`"

    sleep 10

    # Kill off old workers
    run "kill `cat #{File.join(shared_path,'pids','unicorn.pid.oldbin')}`"
    
  end

end

namespace :config do
  desc "Symlink application config files."
  task :symlink do
    run "ln -s #{shared_path}/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    run "ln -s #{shared_path}/config/config.yml #{release_path}/config/config.yml"  
  end
end
