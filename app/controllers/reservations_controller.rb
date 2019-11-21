class ReservationsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if current_user == @room.user
      flash[:alert] = "You cannot book your own property!"
    else
      start_date = Date.parse(reservation_params[:check_in])
      end_date = Date.parse(reservation_params[:check_out])
      nights = (end_date - start_date).to_i
      @reservation = current_user.reservations.new(reservation_params)
      @reservation.room = @room
      @reservation.price = @room.price
      @reservation.total_price = @room.price * nights
      @reservation.save

      flash[:notice] = "Booked Successfully"
    end

    redirect_to @room
  end
  
  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end

end