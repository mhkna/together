module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Together"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def user_in_round?
    return false if current_user == nil
    most_recent_account = current_user.accounts.last
    Round.last.accounts.include?(most_recent_account)
  end

  def round_in_progress?
    (Time.now.strftime('%M%S').to_i < 659) || (Time.now.strftime('%M%S').to_i >= 5958)
  end

  def current_round
    Round.last
  end
end
