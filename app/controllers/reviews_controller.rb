class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    #use the makeup id to write a review for that product
        binding.pry
    if @review.save
    @review.user_id = session.id
    binding.pry
    #attach the makeup with the review
    @review.makeup_id = Makeup.find_by(params[:id])
    end
  end

  def index
    @reviews = Review.all
  end

private
def review_params
  params.require(:review).permit(:title, :content, :rating)
end

end
