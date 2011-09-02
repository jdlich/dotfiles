require 'fileutils'

desc "Copy dotfiles to $HOME"
task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile bash bin README.md]
  files.each do |file|
    FileUtils.cp file, File.join(ENV['HOME'], '.' + file)
  end
end