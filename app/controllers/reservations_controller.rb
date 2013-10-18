class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      @reservation.syndicate(google_token)
      redirect_to reservations_path
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      @reservation.syndicate(google_token)
      redirect_to reservations_path
      flash[:notice] = "You've successfully updated this reservation."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:summary, :start_at, :end_at, :description, :room_id)
  end
end
