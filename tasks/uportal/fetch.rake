desc "Fetch tomcat and uPortal"
task :fetch => ["fetch:tomcat","fetch:uportal"]

namespace :fetch do
  desc "Fetches and unpacks tomcat."
  task :tomcat do
    system "curl -O http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.29/bin/apache-tomcat-6.0.29.tar.gz"
    system "tar xvf apache-tomcat-6.0.29.tar.gz"
    system "rm -rf apache-tomcat-6.0.29.tar.gz"
  end

  desc "Fetches uportal 3.2-patches."
  task :uportal do
    system "svn co https://source.jasig.org/uPortal/branches/rel-3-2-patches/" 
    system "find . -name '.svn' | xargs rm -r"
  end
end