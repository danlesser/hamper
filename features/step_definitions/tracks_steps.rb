Given 'the convention has a track' do
  @track = @convention.tracks.create(attributes_for(:track))
end

When 'I fill out the track form' do
  fill_in('Name', with: 'Nightclub')
  fill_in('Rank', with: '1')
end

Then 'I should see the track' do
  expect(page).to have_content(@convention.tracks.last.name.titleize)
  expect(page).to have_content(@convention.tracks.last.rank)
end

Then 'the track should be removed' do
  expect(Track.count).to be_zero
end
