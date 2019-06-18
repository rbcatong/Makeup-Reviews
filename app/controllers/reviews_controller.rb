class ReviewsController < ApplicationController

  def new
  end

  def create
    @review = Review.create
  end

  def index
    @reviews = Review.all
  end

end
