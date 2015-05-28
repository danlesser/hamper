class TracksController < ApplicationController
  before_action :set_convention, only: [:new, :create]
  before_action :set_track, only: [:edit, :destroy, :update]

  def new
    @track = @convention.tracks.new
  end

  def create
    @track = @convention.tracks.new(track_params)

    if @track.save
      redirect_to convention_path(@convention)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    convention = @track.convention
    @track.destroy
    redirect_to convention_path(convention)
  end

  def update
    if @track.update(track_params)
      redirect_to convention_path(@track.convention)
    else
      render :edit
    end
  end

  private

  def set_convention
    @convention = Convention.find(params[:convention_id])
  end

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :rank)
  end
end
