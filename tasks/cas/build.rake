desc "Builds and deploys CAS"
task :build do
  
  # stop tomcat
  Rake.application.invoke_task :stop
  
  # remove cas from webapps
  system "rm -rf #{TOMCAT}/webapps/cas*"
  
  # build cas
  Dir.chdir("#{CAS}/cas-server-webapp") do
    system "mvn package"
  end
  
  # wait 10 seconds for the build
  1..10.times { |n| print "\rn"; sleep 1 }; puts ""
  
  # copy cas.war to tomcat
  system "cp #{CAS}/cas-server-webapp/target/cas.war #{TOMCAT}/webapps/"
end

# TODO: get the id of the build process and trigger
# the copy command after it finishes