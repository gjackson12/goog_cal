class RoomsController < ApplicationController
  
  def new
    @room = Room.new
    @room.google_access_token = google_token
  end

  def create

    @room = Room.create(room_params)
    
    @room.google_access_token = google_token
    if @room.save
      flash[:notice] = "You created a room"
      redirect_to reservations_path
    else
      render :new
    end
    
  end

  protected

  def room_params
    params.require(:room).permit(:name, :location, :google_calendar_id, :room_number)
  end

end