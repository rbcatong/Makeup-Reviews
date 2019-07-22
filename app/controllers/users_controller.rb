class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Username has been used."
      render :new
    end
  end

  def show
    #doesnt allow other users to see other user profile page and edit it
    if current_user == @user = User.find_by(id: params[:id])
  else
    redirect_to '/'
    end
  end

  def index
    @user_reviews = current_user.reviews
  end

  def edit
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
