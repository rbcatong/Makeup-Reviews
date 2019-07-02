class UsersController < ApplicationController
  def home

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Username has been used."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    # binding.pry
    # @user = User.find_by(id: params[:id])
    # @reviews = @user.reviews
  end

    private

    def user_params
      params.require(:user).permit(:username, :password, :name, :bio, :skintype)
    end

end
