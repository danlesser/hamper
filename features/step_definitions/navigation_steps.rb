When 'I navigate to the home page' do
  visit '/'
end

Then 'I should see that I am using Hamper' do
  expect(page).to have_content('Hamper')
end
