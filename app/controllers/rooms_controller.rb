class RoomsController < ApplicationController
  
  def new
    @room = Room.new
    @room.google_access_token = ENV['TOKEN']
  end

  def create
    @room = Room.create(room_params)
    
    @room.google_access_token = ENV['TOKEN']
    if @room.save
      flash[:notice] = "You created a room"
      redirect_to events_path
    else
      render :new
    end
    
  end

  protected

  def room_params
    params.require(:room).permit(:name, :location, :calendar_id, :room_number)
  end

end