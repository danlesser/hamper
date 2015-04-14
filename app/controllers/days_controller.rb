class DaysController < ApplicationController
  def new
    @convention = Convention.find(params[:convention_id])
    @day = @convention.days.new
  end

  def create
    @convention = Convention.find(params[:convention_id])
    @day = @convention.days.new(day_params)

    if @day.save
      redirect_to convention_path(@convention)
    else
      render :new
    end
  end

  private def day_params
    params.require(:day).permit(:date, :name, :public)
  end
end
