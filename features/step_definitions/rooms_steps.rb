Given 'the convention has a room' do
  @room = @convention.rooms.create(attributes_for(:room))
end

And 'I fill out the room form' do
  fill_in('Name', with: 'Windsor')
  fill_in('Public Name', with: 'Main Stage')
end

Then 'I should see the room' do
  expect(page).to have_content(@convention.rooms.last.name.titleize)
  expect(page).to have_content(@convention.rooms.last.public_name.titleize)
end

Then 'the room should be removed' do
  expect(Room.count).to be_zero
end
