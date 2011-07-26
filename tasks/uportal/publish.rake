desc "Copies skin, theme and cas to tomcat"
task :publish => ["publish:skin","publish:theme","publish:common"]

def rsync src, dst
  system "rsync -ruv --exclude '*svn' --exclude 'scss' --exclude '*sass' #{src} #{dst}"
end

namespace :publish do  
  desc "Copies skin only to tomcat"
  task :skin do
    rsync "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/",
          "#{TOMCAT}/webapps/uPortal/media/skins/universality/"
  end

  desc "Copies theme only to tomcat"
  task :theme do
    rsync "#{UPORTAL}/uportal-war/src/main/resources/layout/theme/universality/",
          "#{TOMCAT}/webapps/uPortal/WEB-INF/classes/layout/theme/universality/"
  end
  
  desc "Copies common to tomcat"
  task :common do
    rsync "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/common/",
          "#{TOMCAT}/webapps/uPortal/media/skins/universality/common/"
  end
  
  # desc "Copies cas skin to tomcat"
  # task :cas do
  #   cas_jsp_src = "#{UPORTAL}/uportal-portlets-overlay/cas/src/main/webapp/WEB-INF/view/jsp/default/ui/*"
  #   cas_jsp_dst = "#{TOMCAT}/webapps/cas/WEB-INF/view/jsp/default/ui/"
  #   cas_img_src = "#{UPORTAL}/uportal-portlets-overlay/cas/src/main/webapp/images"
  #   cas_root    = "#{TOMCAT}/webapps/cas/"
  #   cas_css_src = "#{UPORTAL}/uportal-portlets-overlay/cas/src/main/webapp/css"
  # 
  #   system "cp -r #{cas_jsp_src} #{cas_jsp_dst}" # cas markup
  #   system "cp -r #{cas_img_src} #{cas_root}"    # cas images
  #   system "cp -r #{cas_css_src} #{cas_root}"    # cas css
  # end
end

