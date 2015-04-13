require 'pry-byebug'
require 'simplecov'
require 'timecop'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/dependencies'

Dir[File.expand_path('../fixtures/**/*.rb', __FILE__)].each { |f| require f }

Dir[File.expand_path('../../app/*', __FILE__)].each do |dir|
  ActiveSupport::Dependencies.autoload_paths << dir
end

SimpleCov.start 'rails' do
  coverage_dir 'log/coverage/spec'
  add_filter 'factories'
end

RSpec.configure do |config|
  config.deprecation_stream = 'log/rspec.log'
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = :random

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  config.after(:each) do
    Timecop.return
  end
end
