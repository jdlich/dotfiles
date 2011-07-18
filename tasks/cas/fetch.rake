namespace :fetch do
  desc "Download and unpack CAS"
  task :cas do
    system "svn co https://source.jasig.org/cas3/branches/cas-3_4_x_maintenance/cas-server-3.4.2/"
  end
end