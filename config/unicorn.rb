
worker_processes 25

working_directory "/var/www/TyLovesCandy/current"

listen "/var/www/TyLovesCandy/shared/unicorn.sock", :backlog => 256

pid "/var/www/TyLovesCandy/shared/pids/unicorn.pid"

stderr_path "/var/log/TyLovesCandy/unicorn.log"
stdout_path "/var/log/TyLovesCandy/unicorn.log"

preload_app false

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/var/www/TyLovesCandy/current/Gemfile"
end
