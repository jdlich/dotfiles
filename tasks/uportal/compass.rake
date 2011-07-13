def compass command
  Dir.chdir("#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/#{SKIN}") do
    system "compass #{command}"
  end
end

desc "Alias for compass:watch"
task :compass => ["compass:watch"]

namespace :compass do
  desc "Auto-compile scss to tomcat."
  task :watch do
    compass "watch"
  end
  
  desc "Compile portal.css"
  task :update do
    compass "compile --css-dir styles"
  end
end