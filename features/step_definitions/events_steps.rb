Given 'the convention has an event' do
  @event = @convention.events.create(attributes_for(:event))
end

Given 'the event belongs to a room and a track' do
  @room.events << @event
  @track.events << @event
end

When 'I fill out the event form' do
  fill_in('Timetable Name', with: 'Opening Ceremony')
  fill_in('Conbook Name', with: 'Closing Ceremony')
  fill_in('Conbook Description', with: 'Some sort of ceremony!')
  select(@day.name, from: 'Day')
  select(@track.name, from: 'Track')
  select(@room.name, from: 'Room')
  fill_in('Setup Duration (mins)', with: '20')
  fill_in('Seating Duration (mins)', with: '5')
  fill_in('Event Duration (mins)', with: '43')
  fill_in('Teardown Duration (mins)', with: '19')
  fill_in('Room Layout', with: 'Boardroom')
  fill_in('Convention Equipment', with: 'Projector')
  fill_in('Hotel Equipment', with: 'Water')
  fill_in('Notes', with: 'Keep poom AWAY!')
end

When 'I click on the event' do
  click_link @event.timetable_name
end

Then 'I should see an outline of the event' do
  expect(page).to have_content(@event.timetable_name)
  expect(page).to have_content(@event.day.name)
  expect(page).to have_content(@event.track.name)
  expect(page).to have_content(@event.room.name)
end

Then 'I should see all the details of the event' do

end

Then 'I should see all the details of the new event' do

end

Then 'the event should be removed' do
  expect(Event.count).to be_zero
end
