class RoundsController < SharedController
  before_action :in_progress,   only: [:show]

  ##HIT THIS?
  def create
    @round = Round.new
    @round.save
    session[:round_id] = @round.id
  end

  def show
    @round = Round.last
    @round.matches = @round.matched_accounts(current_user.id, current_user.accounts.last.match_amount)
  end

  private

    def in_progress
      happening_now = round_in_progress?
      has_entry = user_in_round?
      elsif !happening_now && has_entry
        redirect_to :controller => 'accounts', :action => 'show', id: current_user.accounts.last.id
      elsif !happening_now && !has_entry
        redirect_to :controller => 'accounts', :action => 'new'
      end
    end
end
