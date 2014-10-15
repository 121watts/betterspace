class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		if @user.update(user_params)
      Resque.enqueue(WelcomeEmail, current_user)
			redirect_to complaints_path
      flash[:notice] = "Welcome to BetterSpace"
		else
      flash[:error] = "Email invalid"
			render :show
		end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
