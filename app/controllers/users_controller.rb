class UsersController < ApplicationController
  def home
  end

  def new
    #get method for the new user form
    @user = User.new
  end

  def create
    #post method for processing the form.
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    #doesnt allow other users to see other user profile page and edit it
    @user = User.find_by(id: params[:id])
    if current_user == @user
  else
    redirect_to user_path(current_user.id)
    end
  end

  def index
  @user_reviews = current_user.reviews
  redirect_to user_reviews_path, alert: 'Not authorized' if current_user.id != session[:user_id]
  end

  def edit
    #finds the user by using current user method
    @user = current_user
  end

  def update
    @user = current_user
    @user = User.update(bio: params[:user][:bio], skintype: params[:user][:skintype])
    redirect_to user_path
  end

    def topinfluencers
      @users = User.top_points
    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :name, :bio, :skintype, :points)
    end

end
