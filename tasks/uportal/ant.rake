#
# generate ant tasks
#
def uportal command
  Dir.chdir(UPORTAL) { system command }
end

def ant_tasks
  # TODO: check for build.properties

  # parse `ant -p` stdout
  Dir.chdir(UPORTAL) { `ant -p` }.split("\n").map do |task|
    task[/(^\s{1})([a-z]\S+)/, 2]
  end.compact
end

ant_tasks.each do |task|
  task task do
    uportal "ant #{task}"
  end
end