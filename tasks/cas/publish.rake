desc "Alias for publish:webapp"
task :publish => ["publish:webapp"]

namespace :publish do
  
  desc "Publish cas webapp to tomcat"
  task :webapp do
    webapp = "#{CAS}/src/main/webapp/*"
    tomcat = "#{TOMCAT}/webapps/cas/"
    
    system "rsync -rv --exclude=*svn #{webapp} #{tomcat}"
  end
end