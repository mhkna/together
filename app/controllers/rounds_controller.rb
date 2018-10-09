class RoundsController < ApplicationController
  before_action :require_login
  before_action :in_progress,   only: [:show]

  ##HIT THIS?
  def create
    @round = Round.create
    session[:round_id] = @round.id
  end

  def show
    @round = current_round
    @round.matches = @round.matched_accounts(current_user.id, current_user.accounts.last.match_amount)
  end

  private

    def require_login
      redirect_to login_path unless current_user
    end
    
    def in_progress
      happening_now = round_in_progress?
      has_entry = user_in_round?
      if !happening_now && has_entry
        redirect_to :controller => 'accounts', :action => 'show', id: current_user.accounts.last.id
      elsif !happening_now && !has_entry
        redirect_to :controller => 'accounts', :action => 'new'
      end
    end
end
