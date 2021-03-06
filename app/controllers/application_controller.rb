class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def allow
    redirect_to login_url, alert: "You must be logged in to access that" if current_user.nil?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end
