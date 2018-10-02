class RoundsController < ApplicationController
  def create
    @round = Round.new
    @round.save
    session[:round_id] = @round.id
  end

  def show
    @round = Round.find(params[:id])
    @round.matches = @round.matched_accounts(current_user.id, current_user.accounts.last.match_amount)
  end
end
