class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      redirect_to new_session_path, notice: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
