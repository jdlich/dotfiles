desc "Watches tomcat logs"
task :logs do
  log = "#{TOMCAT}/logs/catalina.out"
  system("touch #{log}") unless File.exists?(log)
  system "tail -f #{TOMCAT}/logs/catalina.out"
end

desc "Starts tomcat"
task :start do
  system "./#{TOMCAT}/bin/startup.sh"
end

desc "Stops tomcat"
task :stop do
  system "./#{TOMCAT}/bin/shutdown.sh"
end

desc "Stop, publish and restart tomcat"
task :restart do
  %w{ stop publish start }.each do |task|
    Rake.application.invoke_task(task.to_s)
    sleep 1
  end  
end