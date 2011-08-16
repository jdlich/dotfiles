%w[ mp3info ap wirble bond json ].each do |lib|
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

# Examine mp3 files
def mp3info mp3
  Mp3Info.open(mp3) do |mp3|
    puts "Title: #{mp3.tag.title}"
    puts "Artist: #{mp3.tag.artist}"
    puts "Album: #{mp3.tag.album}"
    puts "Track: #{mp3.tag.tracknum}"
  end
end