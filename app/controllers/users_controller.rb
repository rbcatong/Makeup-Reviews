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
      redirect_to user_path(@user)
    else
      flash[:error] = "Username has been used."
      redirect_to new_user_path
    end
  end

  def show
    binding.pry
    @user = User.find_by(id: params[:user_id])
  end

    private

    def user_params
      params.require(:user).permit(:username, :password, :name, :bio, :skintype)
    end

end
