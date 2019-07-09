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
      @user.increment(:points, 10)
      @user.save
      flash[:success] = "Thank you for reviewing. The review will be posted momentarily."
      redirect_to makeup_review_path(@makeup.id, @review.id)
    else
      redirect_to new_makeup_review_path
    end
  end

  def index
    @makeup = Makeup.find_by(id: params[:makeup_id])
    @reviews = @makeup.reviews
    #shows all reviews for makeup
  end

  def show
    @makeup = Makeup.find_by(id: params[:makeup_id])
    @review = Review.find_by(id: params[:id])
  end

  def edit
    # @makeup = Makeup.find_by(id: params[:makeup_id])

    # -- if user is logged in allows them to only edit their reviews. also allow users to see other makeup
    # @review = Review.find_by(id: params[:id])
  end

  def update
  end

private
def review_params
  params.require(:review).permit(:title, :content, :rating, :makeup_id).merge(:user_id => current_user.id)
end

end
