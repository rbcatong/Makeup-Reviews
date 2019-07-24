class ReviewsController < ApplicationController
before_action :require_login

  def new
    #creates empty review with makeup
      @makeup = Makeup.find_by(id: params[:makeup_id])
      @review = @makeup.reviews.new
  end

  def create
    @makeup = Makeup.find_by(id: params[:makeup_id])
    @review = @makeup.reviews.new(review_params)
    @user = User.find_by(id: @review.user_id) #to increment the user.
    #use the makeup id to write a review for that product
    if @review.save
      @user.increment(:points, 10)
      @user.save
      flash[:success] = "Thank you for reviewing. The review will be posted momentarily."
       redirect_to makeup_review_path(@makeup.id,@review.id)
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
    # -- if user is logged in allows them to only edit their reviews. also allow users to see other makeup
    @review = Review.find_by(id: params[:id])
      redirect_to user_reviews_path, alert: 'Not authorized' if current_user.id != @review.user_id

  end

  def update
      @review = Review.find(params[:id])
       @review.update(title: params[:review][:title], content: params[:review][:content], rating: params[:review][:rating], recommendation: params[:review][:recommendation])
        redirect_to user_reviews_path
  end

  def destroy
    @makeup = Makeup.find(params[:makeup_id])
    @review = @makeup.reviews.find(params[:id])
    @review.destroy
    redirect_to user_reviews_path
  end

  def topreviews
    @topreviews = Review.top_reviews
  end


private
def review_params
  params.require(:review).permit(:title, :content, :rating, :makeup_id, :recommendation).merge(:user_id => current_user.id)
end



def require_login
  return head(:forbidden) unless session.include? :user_id
end

end
