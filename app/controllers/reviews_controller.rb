class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.create
  end

  def index
    @reviews = Review.all
  end

private

  def review_params
  end

end
