require 'irb/completion'
require 'wirble'
require 'mp3info'
require 'ap'

Wirble.init
Wirble.colorize

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Help explore unknown objects
class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end