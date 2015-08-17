class EventsController < ApplicationController
  before_action :set_convention, only: [:index]
  #before_action :set_day, only: [:edit, :destroy, :update]

  def index
    @events = @convention.events.includes(:day, :room, :track)
  end

  #def new
    #@day = @convention.days.new
  #end

  #def create
    #@day = @convention.days.new(day_params)

    #if @day.save
      #redirect_to convention_path(@convention)
    #else
      #render :new
    #end
  #end

  #def edit
  #end

  #def destroy
    #convention = @day.convention
    #@day.destroy
    #redirect_to convention_path(convention)
  #end

  #def update
    #if @day.update(day_params)
      #redirect_to convention_path(@day.convention)
    #else
      #render :edit
    #end
  #end

  #private

  def set_convention
    @convention = Convention.find(params[:convention_id])
  end

  #def set_day
    #@day = Day.find(params[:id])
  #end

  #def day_params
    #params.require(:day).permit(:date, :name, :public)
  #end
end
