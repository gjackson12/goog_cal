class RoomsController < ApplicationController
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)

    cal_parser

    @room.calendar_id = @hash[@room.calendar_id]
    
    if @room.save
      flash[:notice] = "This shit worked!"
      redirect_to events_path
    else
      render :new
    end
    
  end

  protected

  def room_params
    params.require(:room).permit(:name, :location, :calendar_id, :room_number)
  end

  def cal_parser
    @hash = Google::CalendarList.calendar_parser
  end

end