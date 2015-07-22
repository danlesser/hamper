class RoomsController < ApplicationController
  before_action :set_convention, only: [:new, :create]
  before_action :set_room, only: [:edit, :destroy, :update]

  def new
    @room = @convention.rooms.new
  end

  def create
    @room = @convention.rooms.new(room_params)

    if @room.save
      redirect_to convention_path(@convention)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    convention = @room.convention
    @room.destroy
    redirect_to convention_path(convention)
  end

  def update
    if @room.update(room_params)
      redirect_to convention_path(@room.convention)
    else
      render :edit
    end
  end

  private

  def set_convention
    @convention = Convention.find(params[:convention_id])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :public_name)
  end
end
