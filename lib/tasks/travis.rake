task :travis do
  puts "Starting to run xvfb-run -a rake cucumber:all..."
  system("export DISPLAY=:99.0 && xvfb-run -a bundle exec rake cucumber:all")
  raise "xvfb-run -a rake cucumber:all failed!" unless $?.exitstatus == 0
end
