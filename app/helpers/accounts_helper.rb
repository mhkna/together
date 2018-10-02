module AccountsHelper
  def current_account(user)
    user.accounts.last
  end
end
