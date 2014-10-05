class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to complaints_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to signup_path, notice: "Logged out!"
  end

end
