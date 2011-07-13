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
  Rake.application.invoke_task :stop
  sleep 1
  Rake.application.invoke_task :publish
  sleep 1
  Rake.application.invoke_task :start
end

desc "Configures dev environment."
task :config => ["config:build_properties","config:catalina_properties","config:server_xml"] do
  print <<MESSAGE
    To finish setup, run:
    
    ant hsql
    ant initportal
    ant deploy-ear
    rake start
      
MESSAGE
end