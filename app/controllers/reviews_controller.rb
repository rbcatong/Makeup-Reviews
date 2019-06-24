class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.create
    binding.pry
    @review.user_id = session.id
    @review.makeup_id = makeup
  end

  def index
    @reviews = Review.all
  end

private

  def review_params
  end

end
