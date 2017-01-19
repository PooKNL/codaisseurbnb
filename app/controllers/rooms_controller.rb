class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
     @themes = @room.themes
     @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      image_params.each do |image|
        @room.photos.create(image: image)
      end

      redirect_to @room, notice: "Room succesfully created."
    else
      render :new
    end

    def edit
      if current_user.id == @room.user.id
        @photos = @room.photos
      else
        redirect_to rooth_path, notice: "You don/'t have permission."
      end
    end
  end

  def update
    if @room.update(room_params)
      image_params.each do |image|
        @room.photos.create(image: image)
    end

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
        :has_internet, :price, :active, theme_ids: [])
      end

      def image_params
        params[:images].present? ? params.require(:images) : []
      end
end
