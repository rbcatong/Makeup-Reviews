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

  def facebook_login
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.username = auth['info']['email']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
   redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
