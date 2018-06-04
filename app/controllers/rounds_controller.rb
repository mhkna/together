class RoundsController < ApplicationController
  def create
    @round = Round.new
    @round.save
    session[:round_id] = @round.id
  end
end
