class CalendarsController < ApplicationController

  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  def new
    @calendar = Calendar.new
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  def create
    Calendar.create(calendar_parameter)
    redirect_to calendars_path
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_parameter)
      redirect_to calendars_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def calendar_parameter
    params.require(:calendar).permit(:title, :content, :start_time)
  end

end
