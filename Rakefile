require 'fileutils'

def dotfiles
  Dir.entries('.').select { |f| File.file?(f) } - %w[. .. .git .gitignore Rakefile README.md Gemfile Gemfile.lock]
end

desc "Copy dotfiles to $HOME"
task :install do
  dotfiles.each do |file|
    FileUtils.cp file, File.join(ENV['HOME'], '.' + file)
  end
end
