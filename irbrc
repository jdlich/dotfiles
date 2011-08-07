require 'mp3info'
require 'ap'
require 'wirble'
require 'bond'

Wirble.init
Wirble.colorize

Bond.start

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Help explore unknown objects
class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end