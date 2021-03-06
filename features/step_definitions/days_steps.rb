Given 'the convention has a day' do
  @day = @convention.days.create(attributes_for(:day))
end

When 'I visit the convention details page' do
  visit convention_path(@convention)
end

When 'I fill out the day form' do
  fill_in('Name', with: 'Friday')
  select('Public', from: 'Public/Private')
end

Then 'I should see the day' do
  expect(page).to have_content(@convention.days.last.date)
  expect(page).to have_content(@convention.days.last.name.titleize)
  expect(page).to have_content('Public')
end

Then 'the day should be removed' do
  expect(Day.count).to be_zero
end
