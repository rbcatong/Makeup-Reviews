class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
     flash[:error] = "Sorry, we could not find the combination, try again or signup."
      redirect_to '/users/new'
    end
  end

  def destroy
  end
end
