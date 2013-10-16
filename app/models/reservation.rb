class Reservation < ActiveRecord::Base
  validates :summary,       presence: true
  validates :description,   presence: true
  validates :start_at,      presence: true
  validates :end_at,        presence: true
  

   belongs_to :room

  def syndicate(token)
    if room.present? && room.calendar_id?
      event = Google::Event.new(token, build_google_event)
      event.save
      if valid?
        binding.pry
        self.google_event_id = event.id #failing because an event isn't being created
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
      'calendar_id' => self.room.calendar_id,
      'description' => self.description
    }
  end
 end
