class Room < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :room_number
  validates_presence_of :calendar_id

  has_many :events

  def complete_name
    "#{name}"
  end
end
