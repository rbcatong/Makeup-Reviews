require 'pry'
class MakeupProductsController < ApplicationController
  def new
    @makeup_product = MakeupProduct.new
  end

  def create
    @makeup_product = MakeupProduct.create(makeup_product_params)
    if @makeup_product.save
      redirect_to makeup_products_path
    end
  end

  def index
    @makeup_products = MakeupProduct.all
  end

  def show
    @makeup_product = MakeupProduct.find_by(id: params[:id])
  end

  private
  def makeup_product_params
    params.require(:makeup_product).permit(:name, :purpose, :waterproof)
  end
end
