class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      round_in_progress
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
    def round_in_progress
      has_entry = user_in_round?
      happening_now = round_in_progress?
      if has_entry && happening_now
        redirect_to round_path(Round.last)
      elsif !has_entry && happening_now
        redirect_to 'static_pages/wait_room'
      elsif has_entry && !happening_now
        redirect_to :controller => 'accounts', :action => 'show', id: current_user.accounts.last.id
      else
        redirect_to :controller => 'accounts', :action => 'new'
      end
    end
end
