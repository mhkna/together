class AccountsController < SharedController
  def index
    redirect_to nash_path unless current_user.admin?
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
    redirect_to nah_path and return unless authorized? || current_user.admin?
    if Round.last != @account.round
      redirect_to new_account_path
    end
  end

  def edit
    @account = Account.find(params[:id])
    redirect_to nah_path and return unless authorized? || current_user.admin?
  end

  def update
    @account = Account.find(params[:id])
    redirect_to nah_path and return unless authorized? || current_user.admin?
    if @account.update(params[:account].permit(:username))
      redirect_to account_url
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    redirect_to nah_path and return unless authorized? || current_user.admin?
    @account.destroy

    redirect_to root_path, alert: 'You have been romoved from the round'
  end

  private

    def account_params
      params.require(:account).permit(:username, :match_amount)
    end

end
