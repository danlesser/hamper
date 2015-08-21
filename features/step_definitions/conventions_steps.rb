Given 'there is a convention' do
  @convention = create :convention
end

Given 'I am logged in' do
  visit new_user_path
  fill_in 'Name', with: 'Dan'
  fill_in 'Email', with: 'dan@lol.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password Confirmation', with: 'password'
  click_button 'Create User'
  fill_in 'Email', with: 'dan@lol.com'
  fill_in 'Password', with: 'password'
  click_button 'Login'
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

  expect(all('.day').count).to eq 1
  expect(first('.day')).to have_content @day.date
  expect(first('.day')).to have_content @day.name.titleize
  expect(first('.day')).to have_content 'Private'

  expect(all('.track').count).to eq 1
  expect(first('.track')).to have_content @track.name.titleize
  expect(first('.track')).to have_content @track.rank

  expect(all('.room').count).to eq 1
  expect(first('.room')).to have_content @room.name.titleize
  expect(first('.room')).to have_content @room.public_name.titleize
end
