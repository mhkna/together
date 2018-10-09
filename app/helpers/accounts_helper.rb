module AccountsHelper
  def current_account
    current_user.accounts.last
  end

  def authorized?
    return false unless current_account
    current_account.user == current_user
  end
end
