require 'spec_helper'

feature "user creates a new event", %Q{
  As a reservation creator
  I want to reserve a room
  So that I can have a meeting.
}, vcr: false do

    #Acceptance Criteria
    # * Must specify the purpose, expected occupancy, host first name, host last name, starts at, and finishes at
    # * Upon submission of the form, a reservation is created
    # * If I do not specify all required information I am prompted to do so

    scenario "user enters valid information" do
      prev_count = Reservation.count
      first_cal_id = Google::CalendarList.all(ENV["GOOGLE_TOKEN"]).first.id
      room = FactoryGirl.create(:room, google_calendar_id: first_cal_id)

      visit new_reservation_path

      fill_in "Event Title", with: "The best event you never heard of"
      select '2014', from: 'reservation_start_at_1i'
      select 'October', from: 'reservation_start_at_2i'
      select '12', from: 'reservation_start_at_3i'
      select '03', from: 'reservation_start_at_4i'
      select '30', from: 'reservation_start_at_5i'

      select '2014', from: 'reservation_end_at_1i'
      select 'October', from: 'reservation_end_at_2i'
      select '12', from: 'reservation_end_at_3i'
      select '04', from: 'reservation_end_at_4i'
      select '00', from: 'reservation_end_at_5i'
      fill_in "Description", with: "It's everywhere."
      select room.name, from: "Room"

      click_button "Create this Event!"

      expect(Reservation.count).to eql(prev_count + 1)
      expect(Reservation.last.google_event_id).to_not be_nil
    end
  end