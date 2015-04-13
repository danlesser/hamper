class ConventionsController < ApplicationController
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

  private def convention_params
    params.require(:convention).permit(:title, :convention_email, :timeslot_duration)
  end
end
