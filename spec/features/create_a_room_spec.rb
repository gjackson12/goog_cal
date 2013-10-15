require 'spec_helper'

feature 'create a room', %Q{
  As an admin
  I want to create room
  So that users can create reservations 
}, vcr: true do

# Acceptance Criteria
# * I must specify a room name, location, a room number, and a google calendar
# * If I specify all of the above information a new room will be created that is assocaited with a google calendar
# * If I do not enter any of the above required information I will be prompted to do so

  scenario 'admin creates a room' do
    visit new_room_path
    fill_in 'Name', with: 'Ballroom'
    fill_in 'Location', with: '3rd floor'
    fill_in 'Room number', with: '5'
    first_value = find_field('Calendar').find('option:first-child').text
    binding.pry
    select first_value, from: 'Calendar'

    click_on 'Create Room'

    save_and_open_page

    expect(page).to have_content("You created a room")
    expect(Room.last.calendar_id).to_not be_nil
  end

  scenario 'admin fails to create a valid room' do
    visit new_room_path

    click_button 'Create Room'
    expect(page).to have_content("can't be blank")
  end
end
