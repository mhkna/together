class Round < ApplicationRecord
  has_many :accounts

  def account_slice(user_id, match_amount)
    first_index = entry_number(user_id, match_amount)
    accounts[first_index...(first_index + match_amount)]
  end
  # 
  # def matched_accounts(user_id, match_amount)
  #   matched = []
  #   count = 0
  #   found = false
  #   accounts.each do |account|
  #     if account.user_id == user_id
  #       found = true
  #       next
  #     end
  #     if found == false
  #       next
  #     end
  #     while count < match_amount
  #     if found = true
  #       matched << account
  #       count += 1
  #     end
  #   end
  #   if matched.count == match_amount
  #     return matched
  #   elsif matched.count < match_amount && accounts.count > match_amount
  #     missing = match_amount - matched.count
  #   elsif accounts.count < match_amount
  #     missing = match_amount - accounts.count
  #     missing =
  #     accounts[0...missing].each { |account| matched << account }
  #   end
  #   return matched
  # end

  def entry_number(user_id, match_amount)
    count = 0
    accounts.each do |account|
      break if account.user_id == user_id
      count += 1
    end
    return count - match_amount
  end

  def include_user?(user_id)
    accounts.pluck(:user_id).include?(user_id)
  end

  def find_user_account(user_id)
    accounts.find_by(user_id: user_id)
  end
end
