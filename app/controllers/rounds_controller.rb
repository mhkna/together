class RoundsController < ApplicationController

  def create
    redirect_to nah_path unless current_user.admin?
    @round = Round.create
    session[:round_id] = @round.id
  end

  def show
    redirect_to login_path and return unless current_user
    check_progress
    @round = current_round
    @round.matches = @round.matchezzz(current_account.id, current_user.accounts.last.match_amount)
  end

  private

    def check_progress
      happening_now = round_in_progress?
      has_entry = user_in_round?
      if !happening_now && has_entry
        redirect_to :controller => 'accounts', :action => 'show', id: current_user.accounts.last.id
      elsif !happening_now && !has_entry
        redirect_to :controller => 'accounts', :action => 'new'
      elsif !has_entry && happening_now
        redirect_to wait_path
      end
    end

end
