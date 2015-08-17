Given 'the convention has an event' do
  @event = @convention.events.create(attributes_for(:event))
end

Given 'the event belongs to the day, room and track' do
  @day.events << @event
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
  select('Public', from: 'Public/Private')
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
  expect(page).to have_content(@event.timetable_name)
  expect(page).to have_content(@event.conbook_name)
  expect(page).to have_content(@event.conbook_description)
  expect(page).to have_content(@event.day.name)
  expect(page).to have_content(@event.track.name)
  expect(page).to have_content(@event.room.name)
  expect(page).to have_content('Private')
  expect(page).to have_content(@event.setup_duration)
  expect(page).to have_content(@event.seating_duration)
  expect(page).to have_content(@event.event_duration)
  expect(page).to have_content(@event.teardown_duration)
  expect(page).to have_content(@event.room_layout)
  expect(page).to have_content(@event.convention_equipment)
  expect(page).to have_content(@event.hotel_equipment)
  expect(page).to have_content(@event.notes)
end

Then 'I should see all the details of the new event' do
  expect(page).to have_content('Opening Ceremony')
  expect(page).to have_content('Closing Ceremony')
  expect(page).to have_content('Some sort of ceremony!')
  expect(page).to have_content(@day.name)
  expect(page).to have_content(@track.name)
  expect(page).to have_content(@room.name)
  expect(page).to have_content('Public')
  expect(page).to have_content('20')
  expect(page).to have_content('5')
  expect(page).to have_content('43')
  expect(page).to have_content('19')
  expect(page).to have_content('Boardroom')
  expect(page).to have_content('Projector')
  expect(page).to have_content('Water')
  expect(page).to have_content('Keep poom AWAY!')
end

Then 'the event should be removed' do
  expect(Event.count).to be_zero
end
