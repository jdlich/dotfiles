desc "Alias for open:webapp"
task :open => ["open:webapp"]

namespace :open do
  desc "Open Jira ticket if there is one"
  task :jira do
    jira = Dir.pwd.split("/").last.to_i
    
    if jira == 0
      puts "Jira number needs to be in the beginning of the project folder name."
    else
      url = "https://issues.jasig.org/browse/CAS-#{jira.to_s}"
      system "open -a Firefox #{url}"
    end
  end
  
  desc "Opens webapp directory in textmate."
  task :webapp do
    system "mate #{CAS}/cas-server-webapp/src/main/webapp/"
  end
end