module RoundsHelper
  def in_round?(user)
    most_recent_account = user.accounts.last
    Round.last.accounts.include?(most_recent_account)
  end
end
