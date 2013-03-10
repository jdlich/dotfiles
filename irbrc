require 'open-uri'
require 'wirble'
require 'bond'
require 'json'

Wirble.init
Wirble.colorize

Bond.start

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE