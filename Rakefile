require 'fileutils'

def install_vcprompt
  unless File.exists?("/usr/local/bin/vcprompt")
    system "curl -L https://github.com/djl/vcprompt/raw/master/bin/vcprompt > /usr/local/bin/vcprompt"
    system "sudo chmod 755 /usr/local/bin/vcprompt"
  end
end

desc "Copy dotfiles to $HOME"
task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile bash bin README.md]
  files.each do |file|
    FileUtils.cp file, File.join(ENV['HOME'], '.' + file)
  end
  install_vcprompt
end