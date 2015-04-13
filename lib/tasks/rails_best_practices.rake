begin
  require 'rails_best_practices'

  task :rails_best_practices do
    fail unless system('bundle exec rails_best_practices')
  end
rescue LoadError
  puts 'Warning: Rails best practices not available'
end
