require 'irb/completion'
require 'wirble'
require 'mp3info'
require 'pp'

Wirble.init
Wirble.colorize

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Method to help explore unknown objects
class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end