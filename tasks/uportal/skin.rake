desc "Copies skin, theme and cas to tomcat."
task :publish => ["publish:skin","publish:theme","publish:cas"]

namespace :publish do  
  desc "Copies skin only to tomcat."
  task :skin do
    skin_src = "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/*"       
    skin_dst = "#{TOMCAT}/webapps/uPortal/media/skins/universality/"    
    system "cp -r #{skin_src} #{skin_dst}"
  end

  desc "Copies theme only to tomcat."
  task :theme do
    theme_src = "#{UPORTAL}/uportal-war/src/main/resources/layout/theme/universality/*"
    theme_dst = "#{TOMCAT}/webapps/uPortal/WEB-INF/classes/layout/theme/universality/"
    system "cp -r #{theme_src} #{theme_dst}"
  end
  
  desc "Copies common to tomcat."
  task :common do
    common_src = "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/common/*"
    common_dst = "#{TOMCAT}/webapps/uPortal/media/skins/universality/common/"
    system "cp -r #{common_src} #{common_dst}"
  end
  
  desc "Copies cas skin to tomcat."
  task :cas do
    cas_jsp_src = "#{UPORTAL}/uportal-portlets-overlay/cas/src/main/webapp/WEB-INF/view/jsp/default/ui/*"
    cas_jsp_dst = "#{TOMCAT}/webapps/cas/WEB-INF/view/jsp/default/ui/"
    cas_img_src = "#{UPORTAL}/uportal-portlets-overlay/cas/src/main/webapp/images"
    cas_root    = "#{TOMCAT}/webapps/cas/"
    cas_css_src = "#{UPORTAL}/uportal-portlets-overlay/cas/src/main/webapp/css"

    system "cp -r #{cas_jsp_src} #{cas_jsp_dst}" # cas markup
    system "cp -r #{cas_img_src} #{cas_root}"    # cas images
    system "cp -r #{cas_css_src} #{cas_root}"    # cas css
  end
  
  desc "Copies skinlist to tomcat."
  task :skinlist do
    skinlist_src = "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/skinList.xml"
    skinlist_dst = "#{TOMCAT}/webapps/uPortal/media/skins/universality/"
    system "cp #{skinlist_src} #{skinlist_dst}"
  end
end

