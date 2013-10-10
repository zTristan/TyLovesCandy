set :application, "TyLovesCandy"
set :repository,  "https://github.com/zTristan/TyLovesCandy.git"
set :deploy_to, "/var/www/#{application}"
set :user, "tristan"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false

role :web, "162.243.128.152"                          # Your HTTP server, Apache/etc
role :app, "162.243.128.152"                          # This may be the same as your `Web` server
role :db,  "162.243.128.152", :primary => true # This is where Rails migrations will run
role :db,  "162.243.128.152"

after "deploy:update", "deploy:cleanup" 

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

    sleep 120

    # Kill off old workers
    run "kill `cat #{File.join(shared_path,'pids','unicorn.pid.oldbin')}`"
    
  end

end
