class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_url
    else
      render :new, status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
