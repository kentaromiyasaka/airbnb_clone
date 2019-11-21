class RoomsController < ApplicationController
  before_action :room_find, only: [:listing, :pricing, :description, :photos, :amenities, :location ,:show, :preload, :preview]

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
    @room = Room.find(params[:id])

    final_params = (ready?(@room) ? rooms_params.merge(is_active: true) : rooms_params)

    if @room.update(final_params)
      flash[:notice] = "Your room is updated"
      redirect_back(fallback_location: request.referer)
    else
      flash[:alert] = "There is error"
      render "new"
    end
  end

  def preload
    today = Date.today
    reservations = @room.reservations.where("check_in >= ? OR check_out >= ?", today, today)

    render json: reservations
  end

  def index
    @rooms = current_user.rooms
  end

  def show
    @photos = @room.photos
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photos
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  def preview
    start_date = Date.parse(params[:check_in])
    end_date = Date.parse(params[:check_out])

    output = {
      conflict: has_conflict(start_date, end_date, @room)
    }
    render json: output
  end

  private

  def room_find
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name, :price, :address, :home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :summary, :has_tv, :has_aircon, :has_heating, :has_internet, :has_kitchen, :is_active)
  end

  def has_conflict(check_in, check_out, room)
    check = room.reservations.where("? < check_in AND check_out < ?", check_in, check_out)
    check.size > 0 ? true : false
  end

end