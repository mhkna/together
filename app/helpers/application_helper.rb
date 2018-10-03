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

  def check_or_x
    if current_user.accounts.last.round == Round.last
      '<i class="fas fa-check"></i>'
    else
      '<i class="fas fa-times"></i>'
    end
  end

end
