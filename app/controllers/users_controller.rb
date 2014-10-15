class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to complaints_path
      flash[:notice] = "Welcome to BetterSpace"
		else
			render :show
		end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
