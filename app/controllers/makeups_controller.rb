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
    @makeups = Makeup.all
  end

  def show
    @makeup = Makeup.find_by(id: params[:id])
  end

  private
  def makeup_params
    params.require(:makeup).permit(:name, :purpose,:waterproof)
  end
end
