class RoomsController < ApplicationController
  
  def new
    @room = Room.new
    @room.google_access_token = session[:token]
  end

  def create
    @room = Room.create(room_params)
    
    @room.google_access_token = session[:token]
    if @room.save
      flash[:notice] = "You created a room"
      redirect_to reservations_path
    else
      render :new
    end
    
  end

  protected

  def room_params
    params.require(:room).permit(:name, :location, :calendar_id, :room_number)
  end

end