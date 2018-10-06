class RoundsController < ApplicationController
  before_action :require_login

  def create
    @round = Round.new
    @round.save
    session[:round_id] = @round.id
  end

  def show
    in_round = user_in_round
    time_in = (Time.now.strftime('%M').to_i < 55) || (Time.now.strftime('%M%S').to_i >= 5958)
    if in_round && time_in
      @round = Round.last
      @round.matches = @round.matched_accounts(current_user.id, current_user.accounts.last.match_amount)
    elsif !in_round && time_in
      redirect_to wait_path
    elsif !in_round && !time_in
      redirect_to :controller => 'accounts', :action => 'new'
    elsif in_round && !time_in
      redirect_to :controller => 'accounts', :action => 'show', id: current_user.accounts.last.id
    end
  end

  private
  
    def require_login
      redirect_to login_url unless current_user
    end
end
