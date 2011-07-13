namespace :sass do
  desc "Watches SASS direcotry and auto-compiles CSS."
  task :sass do
    src = "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/#{SKIN}/scss"
    dst = "#{TOMCAT}/webapps/uPortal/media/skins/universality/#{SKIN}"
    system "sass --watch #{src}:#{dst} --style expanded"
  end
  
  desc "Updates portal.css"
  task :update do
    src = "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/#{SKIN}/scss"
    dst = "#{TOMCAT}/webapps/uPortal/media/skins/universality/#{SKIN}"
    system "sass --update #{src}:#{dst} --style expanded"
  end
end