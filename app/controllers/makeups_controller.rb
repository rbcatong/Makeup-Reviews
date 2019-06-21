require 'pry'
class MakeupsController < ApplicationController
  def new
    @makeup= Makeup.new
  end

  def create
    @makeup = Makeup.create(makeup_params)
    if @makeup.save
      redirect_to makeup_path
    end
  end

  def index
    @makeups = MakeupProduct.all
  end

  def show
    @makeup = MakeupProduct.find_by(id: params[:id])
  end

  private
  def makeup_params
    params.require(:makeup).permit(:name, :purpose, :waterproof)
  end
end
