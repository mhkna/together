class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def account_params
    params.require(:account).permit(:website, :username)
  end
end
