module ApplicationHelper
  # returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = "Together"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def user_in_round
    return false if current_user == nil
    most_recent_account = current_user.accounts.last
    Round.last.accounts.include?(most_recent_account)
  end

  def in_progress?
    Time.now.strftime('%M').to_i < 7
  end
end
