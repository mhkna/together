module RoundsHelper
  def in_round?(user)
    return false if user == nil
    most_recent_account = user.accounts.last
    Round.last.accounts.include?(most_recent_account)
  end
end
