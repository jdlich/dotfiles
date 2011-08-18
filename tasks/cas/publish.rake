desc "Alias for publish:webapp"
task :publish => ["publish:webapp"]

namespace :publish do
  
  desc "Publish cas webapp to tomcat"
  task :webapp do
    webapp = "#{CAS}cas-server-webapp/src/main/webapp/*"
    tomcat = "#{TOMCAT}/webapps/cas/"
    
    system "rsync -ruv --exclude '*svn' #{webapp} #{tomcat}"
  end
end