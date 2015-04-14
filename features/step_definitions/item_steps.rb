When(/I click on the (.*) button/) do |name|
  click_on name
end

When(/I click the (.*) link for an? (.*)/) do |link, _item|
  first('.item').find(:link, link).click
end

When(/I click the (.*) link and confirm/) do |link|
  accept_confirm do
    first('.item').find(:link, link).click
  end
end
