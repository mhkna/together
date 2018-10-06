class AccountsController < ApplicationController
  before_action :round_in_progress
  before_action :admin_user,           only: [:index]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    @account.round = Round.last
    unless @account.round.include_user?(current_user.id)
      if @account.save
        redirect_to new_account_comment_url(@account)
      else
        render :new
      end
    else
      redirect_to account_url(@account.round.find_user_account(current_user.id)),
      alert: 'You already have a round entry'
    end
  end

  def show
    @account = Account.find(params[:id])
    if Round.last != @account.round
      redirect_to new_account_path
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(params[:account].permit(:username))
      redirect_to account_url
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    redirect_to root_path, alert: 'You have been romoved from the round'
  end

  private

    def account_params
      params.require(:account).permit(:username, :match_amount)
    end

    # Before filter
    def round_in_progress
      if in_progress? && user_in_round
        redirect_to round_path(Round.last)
      elsif in_progress?
        redirect_to wait_path
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
