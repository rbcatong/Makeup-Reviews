class MakeupProductsController < ApplicationController
  def new
    @makeup_product = MakeupProduct.new
  end

  def create
    @makeup_product = MakeupProduct.create
  end
end
