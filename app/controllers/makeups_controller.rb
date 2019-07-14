require 'pry'
class MakeupsController < ApplicationController
  def new
    @makeup = Makeup.new
  end

  def create
    @makeup = Makeup.create(makeup_params)
    @makeup.user_id = session[:user_id]
    if @makeup.save
      redirect_to makeup_path(@makeup)
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
