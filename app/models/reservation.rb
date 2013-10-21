class Reservation < ActiveRecord::Base
  validates :summary,       presence: true
  validates :description,   presence: true
  validates :start_at,      presence: true
  validates :end_at,        presence: true
  

   belongs_to :room
   belongs_to :user, inverse_of: :reservations

  def syndicate(token)
    if room.present? && room.google_calendar_id?
      event = Google::Event.new(token, build_google_event, self.google_event_id)
      event.save
      if valid?
        self.google_event_id = event.id 
        self.save
      else
        return false
      end
    else
      return true
    end
  end

  def build_google_event
   event = {
      'summary' => self.summary,
      'start_at' => self.start_at.to_datetime,
      'end_at' => self.end_at.to_datetime,
      'calendar_id' => self.room.google_calendar_id,
      'description' => self.description
    }
  end
end
