class ConventionsController < ApplicationController
  before_action :set_convention, except: [:index, :new, :create]

  def index
    @conventions = Convention.all
  end

  def new
    @convention = Convention.new
  end

  def create
    @convention = Convention.new(convention_params)
    @convention.save
    redirect_to conventions_path
  end

  def edit
  end

  def destroy
    @convention.destroy
    redirect_to conventions_path
  end

  def update
    @convention.update(convention_params)
    redirect_to conventions_path
  end

  private

  def set_convention
    @convention = Convention.find(params[:id])
  end

  def convention_params
    params.require(:convention).permit(:title, :convention_email, :timeslot_duration)
  end
end
