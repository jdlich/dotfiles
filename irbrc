%w[ mp3info ap wirble bond json skedikkell ].each do |lib|
  begin
    require lib
  rescue LoadError
    puts "WARNING: could not load '#{lib}'"
  end
end

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