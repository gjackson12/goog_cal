class Room < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :room_number
  validates_presence_of :google_calendar_id

  has_many :reservations

  attr_accessor :google_access_token

  def complete_name
    "#{name}"
  end

  def google_calendar_map
    Google::CalendarList.calendar_map(self.google_access_token)
  end
end
