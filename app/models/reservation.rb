class Reservation < ActiveRecord::Base
  validates :summary,       presence: true
  validates :description,   presence: true
  validates :start_at,      presence: true
  validates :end_at,        presence: true
  

   belongs_to :room

  def syndicate(token)
    if room.present? && room.calendar_id?
      binding.pry
      event = Google::Event.new(token, build_google_event).save
      if self.id.present?
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
      'start_at' => {
        'dateTime' => self.start_at
      },
      'end_at' => {
        'dateTime' => self.end_at
      },
      'calendar_id' => self.room_id,
      'description' => self.description
    }
  end
 end
