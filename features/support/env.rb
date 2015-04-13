require 'cucumber/rails'
require 'capybara-screenshot/cucumber'
require 'cucumber/rspec/doubles'
require 'timecop'
require 'database_cleaner'
require 'webmock/cucumber'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryGirl::Syntax::Methods)
FactoryGirl.find_definitions

Capybara.javascript_driver = :webkit
Capybara::Screenshot.prune_strategy = :keep_last_run

WebMock.disable_net_connect!(allow_localhost: true)
