Given 'there is a convention' do
  @convention = create :convention
end

When 'I visit the conventions page' do
  visit conventions_path
end

When 'I fill out the convention form' do
  fill_in('Title', with: 'ConFuzzled 2015')
  fill_in('Convention Email', with: 'events@confuzzled.org.uk')
  select('15', from: 'Timeslot Duration')
end

When 'I click on a convention' do
  click_link @convention.title
end

Then 'I should see a list of the conventions' do
  expect(page).to have_content(@convention.title)
end

Then 'I should see the convention' do
  expect(page).to have_content('ConFuzzled 2015')
end

Then 'the convention should be removed' do
  expect(Convention.count).to be_zero
end

Then 'I should see the details of the convention' do
  expect(page).to have_content(@convention.convention_email)
  expect(page).to have_content(@convention.timeslot_duration)
end
