desc "Adds tasks to tab complete cache file."
task :cache do
  tasks = `rake --tasks`.split("\n")[1..-1].collect {|line| line.split[1]}
  File.open('.rake_cache', 'w') { |f| f.write tasks.join("\n") }
end