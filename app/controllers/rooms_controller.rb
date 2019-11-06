class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(rooms_params)
    if @room.save
      redirect_to listing_room_path(@room)
    else
      flash[:alert] = "There is error"
      render "new"
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name,:price ,:address ,:home_type ,:room_type ,:guest_count ,:bedroom_count ,:bathroom_count ,:summary ,:has_tv ,:has_aircon ,:has_heating,:has_internet, :has_kitchen, :is_active)
  end
end