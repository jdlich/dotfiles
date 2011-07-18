namespace :fetch do
  desc "Fetches uportal 3.2-patches"
  task :uportal do
    system "svn co https://source.jasig.org/uPortal/branches/rel-3-2-patches/" 
    system "find . -name '.svn' | xargs rm -r"
  end
end