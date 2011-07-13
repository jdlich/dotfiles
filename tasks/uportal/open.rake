desc "Opens skin & theme in textmate."
task :open => ["open:theme","open:skin"]

namespace :open do
  desc "Open theme in textmate."
  task :theme do
    system "mate #{UPORTAL}/uportal-war/src/main/resources/layout/theme/universality/"
  end
  
  desc "Opens skin in textmate."
  task :skin do
    system "mate #{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/#{SKIN}"
  end
  
  desc "Opens common in textmate."
  task :common do
    system "mate #{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/common"
  end
end