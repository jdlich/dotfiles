desc "Watches tomcat logs."
task :logs do
  system "tail -f #{TOMCAT}/logs/catalina.out"
end

desc "Starts tomcat."
task :start do
  system "./#{TOMCAT}/bin/startup.sh"
end

desc "Stops tomcat."
task :stop do
  system "./#{TOMCAT}/bin/shutdown.sh"
end

desc "Configures dev environment."
task :config => ["config:build_properties","config:catalina_properties","config:server_xml"] do
  print <<MESSAGE
    To finish setup, run:
    
    ant hsql
    ant initportal
    ant deploy-ear
    rake start
      
MESSAGE
end

namespace :config do
  
  desc "Configures build.properties"
  task :build_properties do
    system "cp #{UPORTAL}/build.properties.sample #{UPORTAL}/build.properties"
    
    file    = "#{UPORTAL}/build.properties"
    config  = "server.home=#{File.expand_path(TOMCAT)}\n"
    changes = File.read(file).gsub(/^(server\.home.+\n)/, config)
        
    File.open(file,"w+") { |f| f.write changes }
  end
  
  desc "Configures catalina.properties"
  task :catalina_properties do
    file    = "#{TOMCAT}/conf/catalina.properties"
    config  = "shared.loader=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar\n"
    changes = File.read(file).gsub(/^(shared\.loader.+\n)/, config)
      
    File.open(file,"w+") { |f| f.write changes }
  end
  
  desc "Configures server.xml"
  task :server_xml do
    file = "#{TOMCAT}/conf/server.xml"
    xml  = Nokogiri::XML(File.read(file))
    
    xml.css("Connector[port='8080']").first['emptySessionPath'] = 'true'
    
    File.open(file,'w+') { |f| f.write xml }
  end
  
  desc "Disable cache in web.xml"
  task :disable_cache do
    pattern = %{<filter-mapping><filter-name>pageCachingFilter</filter-name><url-pattern>*.js</url-pattern><url-pattern>*.css</url-pattern></filter-mapping>}
    replace = "<!--" + pattern + "-->"
    web_xml = "#{TOMCAT}/webapps/uPortal/WEB-INF/web.xml"
  
    disable_cache = File.read(web_xml).gsub(pattern,replace)
    File.open(web_xml, "w+") { |f| f.write disable_cache }
  end
end