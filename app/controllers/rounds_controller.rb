class RoundsController < ApplicationController
  include RoundsHelper

  def create
    @round = Round.new
    @round.save
    session[:round_id] = @round.id
  end

  def show
    in_round = in_round?(current_user)
    time_in = Time.now.strftime('%M').to_i < 7
    if time_in && in_round
      @round = Round.find(params[:id])
      @round.matches = @round.matched_accounts(current_user.id, current_user.accounts.last.match_amount)
    elsif time_in
      # Wait for new round
    elsif in_round == false
      redirect_to :controller => 'accounts', :action => 'new'
    else
      redirect_to :controller => 'accounts', :action => 'show', id: current_user.accounts.last.id
    end
  end
end
