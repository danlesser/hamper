Given 'there are some conventions' do
  @conventions = create_list(:convention, 2)
end

When 'I visit the conventions page' do
  visit '/conventions'
end

When 'I fill out the convention form' do
  fill_in('Title', with: 'ConFuzzled')
  fill_in('Convention Email', with: 'events@confuzzled.org.uk')
  select('15', from: 'Timeslot Duration')
end

Then 'I should see a list of the conventions' do
  @conventions.each do |convention|
    expect(page).to have_content(convention.title)
    expect(page).to have_content(convention.convention_email)
  end
end

Then 'I should see the convention' do
  expect(page).to have_content('ConFuzzled')
  expect(page).to have_content('events@confuzzled.org.uk')
end
