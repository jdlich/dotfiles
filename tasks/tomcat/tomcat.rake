namespace :fetch do
  desc "Fetches and unpacks tomcat."
  task :tomcat do
    system "curl -O http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.29/bin/apache-tomcat-6.0.29.tar.gz"
    system "tar xvf apache-tomcat-6.0.29.tar.gz"
    system "rm -rf apache-tomcat-6.0.29.tar.gz"
  end
end

desc "Watches tomcat logs."
task :logs do
  system "tail -f #{TOMCAT}/logs/catalina.out"
end

desc "Starts tomcat."
task :start do
  system "./#{TOMCAT}/bin/startup.sh"
end

desc "Stops tomcat."
task :stop do
  system "./#{TOMCAT}/bin/shutdown.sh"
end

desc "Stop, publish and restart tomcat."
task :restart do
  %w{ stop publish start }.each do |task|
    Rake.application.invoke_task(task.to_s)
    sleep 1
  end  
end