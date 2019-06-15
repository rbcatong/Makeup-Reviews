class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

    private

    def user_params
      params.require(:user).permit(:username, :password, :name, :bio, :skintype)
    end

end
