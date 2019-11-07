class RoomsController < ApplicationController
  before_action :room_find, only: [:listing, :pricing, :description, :photos, :amenities, :location]

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

  def update
    @room =Room.find(params[:id])
    if @room.update(rooms_params)
      flash[:notice] = "Your room is updated"
      redirect_back(fallback_location: request.referer)
    else
      flash[:alert] = "There is error"
      render "new"
    end
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photos
  end

  def amenities
  end

  def location
  end

  private

  def room_find
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name,:price ,:address ,:home_type ,:room_type ,:guest_count ,:bedroom_count ,:bathroom_count ,:summary ,:has_tv ,:has_aircon ,:has_heating,:has_internet, :has_kitchen, :is_active)
  end
end