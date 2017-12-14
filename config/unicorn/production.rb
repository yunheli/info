# paths
app_root = File.expand_path("../../..", __FILE__)
working_directory app_root

# pid
pid "#{app_root}/tmp/pids/unicorn.pid"

timeout 30

# listen
listen 3000
listen "/tmp/unicorn-info.socket", backlog: 64

# logging
stderr_path "log/unicorn.stderr.log"
stdout_path "log/unicorn.stdout.log"

# workers
worker_processes 3

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(app_root, 'Gemfile')
end


before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      puts "Send #{sig} signal to unicorn error!"
    end
  end
end

after_fork do |server, worker|
  GC.disable
end
