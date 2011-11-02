require 'fileutils'
require 'open-uri'

desc "Copy dotfiles to $HOME"
task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile bash bin README.md Gemfile Gemfile.lock]
  files.each do |file|
    FileUtils.cp file, File.join(ENV['HOME'], '.' + file)
  end
end

desc "Install vcprompt"
task :vcprompt do
  unless File.exists?("/usr/local/bin/vcprompt")
    download = "https://raw.github.com/djl/vcprompt/master/bin/vcprompt"
    filename = "/usr/local/bin/vcprompt"
    download(url, filename) do
      File::chmod 0001, "/usr/local/bin/vcprompt", "out"
    end    
  end
end

def download(url, filename, &block)
  File.open(filename, "w+") do |f|
    f.write open(download).read
  end
  yield if block_given?
end