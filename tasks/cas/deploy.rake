desc "Alias for CAS build, clean, and deploy."
task :deploy => ["stop", "cas:clean", "cas:build", "cas:deploy"] do
  sleep 3 # allow some time for tomcat
  Rake.application.invoke_task :start
end

namespace :cas do
  desc "Build CAS and auto-deploy war."
  task :build do
    Dir.chdir("#{CAS}") do
      system "mvn package"
    end
  end

  desc "Removes CAS from tomcat."
  task :clean do
    system "rm -rf #{TOMCAT}/webapps/cas*"
  end
  
  desc "Deploys cas.war to tomcat"
  task :deploy do
    system "cp #{CAS}/target/cas.war #{TOMCAT}/webapps/"
  end
end
