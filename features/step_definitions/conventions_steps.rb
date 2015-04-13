Given 'there are some conventions' do
  @conventions = create_list(:convention, 2)
end

When 'I go to the conventions page' do
  visit '/conventions'
end

Then 'I should see a list of the conventions' do
  @conventions.each do |convention|
    expect(page).to have_content(convention.title)
    expect(page).to have_content(convention.convention_email)
  end
end
