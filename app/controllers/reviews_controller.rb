class ReviewsController < ApplicationController

  def new
    #creates empty review with makeup
      @makeup = Makeup.find_by(id: params[:makeup_id])
      @review = @makeup.reviews.new
  end

  def create
    @makeup = Makeup.find_by(id: params[:makeup_id])
    @review = @makeup.reviews.new(review_params)
    @user = User.find_by(id: @review.user_id)
    #use the makeup id to write a review for that product
    if @review.save
      @user.increment(:points,  10)
      @user.save
    @makeup.reviews << @review
      redirect_to makeup_review_path(@makeup.id)
    else
      redirect_to new_makeup_review_path
    end
  end

  def index
    @reviews = Review.all
    #shows all reviews for makeup
  end

  def show
    @makeup = Makeup.find_by(id: params[:makeup_id])
    @reviews = @makeup.reviews
  end

  def update
  end

private
def review_params
  params.require(:review).permit(:title, :content, :rating, :makeup_id).merge(:user_id => current_user.id)
end

end
