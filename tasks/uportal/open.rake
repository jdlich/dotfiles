def open_in_textmate directory
  if File.exists?(directory)
    system "mate #{directory}"
  else
    puts "#{directory} doesn't exist."
  end
end

projects = {
  :theme  => "#{UPORTAL}/uportal-war/src/main/resources/layout/theme/universality/",
  :skin   => "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/#{SKIN}",
  :common => "#{UPORTAL}/uportal-war/src/main/webapp/media/skins/universality/common"
  # cas
  # dlm
}

desc "Opens skin & theme in textmate."
task :open => ["open:theme","open:skin"]

namespace :open do
  projects.each do |name, dir|
    desc "Open #{name.to_s} in textmate."
    task name do
      open_in_textmate dir
    end
  end
end