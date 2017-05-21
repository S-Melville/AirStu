class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update] #before shew/edit/update action the set room method is called
  before_action :authenticate_user!, except: [:show] #users can view rooms but must be authenticated before they can edit/update

  def index
    @rooms = current_user.rooms #user model has_many rooms which allows us to create this method
  end

  def show
    @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save #creates new room and saves it to the db
      
      if params[:images] 
          params[:images].each do |image| #saves photos into rooms
            @room.photos.create(image: image)
          end
        end
  
        @photos = @room.photos
        redirect_to edit_room_path(@room), notice: "Saved..."
      else
        render :new
      end
    end

  def edit
    if current_user.id == @room.user.id
      @photos = @room.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @room.update(room_params)

      if params[:images] 
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end

      redirect_to edit_room_path(@room), notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_room
      @room = Room.find(params[:id]) #created new rooms variable
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
    end
end
