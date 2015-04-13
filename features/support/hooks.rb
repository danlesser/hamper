require 'timecop'

Before do
  RSpec::Mocks.setup
end

After do
  Timecop.return
end

Before('@frozen') do
  Timecop.travel Time.now
end

After('@javascript') do |_scenario|
  page.driver.error_messages.each do |error|
    fail "JavaScript error in #{error[:source]}:#{error[:line_number]} \n #{error[:message]}"
  end

  page.driver.console_messages.each do |log|
    fail "JavaScript log in #{log[:source]}:#{log[:line_number]} \n #{log[:message]}"
  end
end
