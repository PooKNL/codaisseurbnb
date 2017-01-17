class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, notice: "Room succesfully created."
    else
      render :new
    end

    def edit
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room succesfully updated"
    else
      render :edit
    end
  end

    private
      def set_room
        @room = Room.find(params[:id])
      end

      def room_params
        params.require(:room) .permit(:home_type, :room_type, :accommodate,
        :bedroom_count, :bathroom_count, :listing_name, :description,
        :address, :has_tv, :has_kitchen, :has_airco, :has_eating,
        :has_internet, :price, :active)
      end

end
