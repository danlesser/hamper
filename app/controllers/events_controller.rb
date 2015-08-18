class EventsController < ApplicationController
  before_action :set_convention, only: [:index, :new, :create]
  before_action :set_event, only: [:edit, :destroy, :update]

  def index
    @events = @convention.events.includes(:day, :room, :track)
  end

  def show
    @event = Event.includes(:day, :room, :track).find(params[:id])
  end

  def new
    @event = @convention.events.new
  end

  def create
    @event = @convention.events.new(event_params)

    redirect_to event_path(@event) if @event.save
  end

  def edit
  end

  def update
    redirect_to event_path(@event) if @event.update(event_params)
  end

  def destroy
    convention = @event.convention
    @event.destroy
    redirect_to convention_events_path(convention)
  end

  private

  def set_convention
    @convention = Convention.find(params[:convention_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:timetable_name, :conbook_name, :conbook_description,
                                  :day_id, :start_time, :track_id, :room_id, :public,
                                  :setup_duration, :seating_duration, :event_duration,
                                  :teardown_duration, :room_layout, :convention_equipment,
                                  :hotel_equipment, :event_runners, :notes)
  end
end
