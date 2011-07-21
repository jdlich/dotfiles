desc "Build and deploy CAS to tomcat."
task :deploy => [:stop, :clean, :build, :start]

namespace :cas do
  desc "Build CAS and auto-deploy war."
  task :build do
    war = "#{CAS}/target/cas.war"
    Dir.chdir("#{CAS}") do
      system "mvn package && cp #{war} #{TOMCAT}/webapps/"
    end
  end

  desc "Removes CAS from tomcat."
  task :clean do
    system "rm -rf #{TOMCAT}/webapps/cas*"
  end
end
