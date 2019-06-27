class ReviewsController < ApplicationController

  def new
    #creates emptrty review witgh makeup
      @makeup = Makeup.find_by(params[:id])
      @review = @makeup.reviews.new

  end

  def create
    @makeup = Makeup.find_by(params[:id])
    @review = @makeup.reviews.new(review_params)

    #use the makeup id to write a review for that product

    if @review.save
    #attach the makeup with the review
  redirect_to makeup_reviews_path
    end
  end

  def index
    @reviews = Review.all
  end

private
def review_params
  params.require(:review).permit(:title, :content, :rating, :makeup_id).merge(:user_id => current_user.id)
end

end
