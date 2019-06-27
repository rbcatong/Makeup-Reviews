class ReviewsController < ApplicationController

  def new
    @review = Review.new
    binding.pry
    @makeup = Makeup.find_by(params[:id])
  end

  def create
    binding.pry


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
  params.require(:review).permit(:title, :content, :rating, :makeup_id).merge(:user_id => current_user.id)
end

end
