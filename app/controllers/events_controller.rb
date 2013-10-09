class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new 
  end

  def create
    @event = Event.new(event_params)
    event = {
      'summary' => @event.summary,
      'start_at' => {
        'dateTime' => @event.start_at
      },
      'end_at' => {
        'dateTime' => @event.end_at
      },
      'calendar_id' => @event.room_id,
      'description' => @event.description
    }
    new_cal_event = Google::Event.new(event)

    new_cal_event.parameters
    new_cal_event.body
    new_cal_event.save
  end

  private

  def event_params
    params.require(:event).permit(:summary, :start_at, :end_at, :description, :room_id)
  end
end
