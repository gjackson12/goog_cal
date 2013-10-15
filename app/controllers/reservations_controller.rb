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
      @reservation.syndicate(session[:token])
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:summary, :start_at, :end_at, :description, :room_id)
  end
end
