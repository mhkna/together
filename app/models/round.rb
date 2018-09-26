class Round < ApplicationRecord
  has_many :accounts

  def account_slice(user_id, match_amount)
    first_index = entry_number(user_id, match_amount)
    accounts[first_index...(first_index + match_amount)]
  end

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
