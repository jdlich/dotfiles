namespace :fetch do
  desc "Fetches and unpacks tomcat."
  task :tomcat do
    system "curl -O http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.29/bin/apache-tomcat-6.0.29.tar.gz"
    system "tar xvf apache-tomcat-6.0.29.tar.gz"
    system "rm -rf apache-tomcat-6.0.29.tar.gz"
  end
end