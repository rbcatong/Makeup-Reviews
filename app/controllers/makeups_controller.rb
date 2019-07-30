require 'pry'
class MakeupsController < ApplicationController
  def new
    @makeup = Makeup.new
  end

  def create
    @makeup = Makeup.new(makeup_params)
    if @makeup.save
      @makeup.user_id = session[:user_id]
      redirect_to makeup_path(@makeup)
    else
      flash[:error] = "Please make sure all fields are filled."
      render :new
    end
  end

  def index
    #showing the list of all the makeups
    @makeups = Makeup.all
  end

  def show
    #showing each individual makeup
    @makeup = Makeup.find_by(id: params[:id])
  end

  private
  def makeup_params
    params.require(:makeup).permit(:name, :purpose,:waterproof,:category)
  end
end
