class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    @account.round = Round.last #session[:round_id]

    if @account.save
      redirect_to account_url(@account)
    else
      render :new
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
  end

  private

    def account_params
      params.require(:account).permit(:website, :username)
    end
end
