class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def rooms_params
    params.require(:room).permit(:name,:price ,:address ,:home_type ,:room_type ,:guest_count ,:bedroom_count ,:bathroom_count ,:summary ,:has_tv ,:has_aircon ,:has_heating,:has_internet, :has_kitchen, :is_active)
  end
end