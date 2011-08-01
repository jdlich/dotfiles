skin = "#{SAKAI}/reference/library/src/webapp/skin/#{SKIN}"

namespace :open do
  desc "Open skin in Textmate"
  task :skin do
    system "mate #{skin}"
  end
end

def rsync src, dst
  system "rsync -ruv --exclude '*svn' --exclude 'scss' --exclude '.sass*' #{src} #{dst}"
end

desc "Publish skin to Tomcat"
task :publish do
  rsync skin, "#{TOMCAT}/webapps/library/skin/"
end