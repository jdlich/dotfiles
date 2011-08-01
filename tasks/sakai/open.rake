namespace :open do
  desc "Open skin in Textmate."
  task :skin do
    system "mate #{SAKAI}/reference/library/src/webapp/skin/#{SKIN}"
  end
end