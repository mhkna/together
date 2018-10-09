class Round < ApplicationRecord
  has_many :accounts
  ## used on controller
  attr_accessor :matches


  def matchezzz(account_id, match_amount)
    higher_accounts = self.accounts.where('id > ?', account_id)
    matches = higher_accounts.first(match_amount)

    if matches.count == match_amount
      return matches
    else
      accounts_needed = match_amount - matches.count
    end

    lower_accounts = self.accounts.where('id < ?', account_id)
    more_matches = lower_accounts.first(accounts_needed)

    concat_matches = []
    matches.each do |match|
      concat_matches << match
    end
    more_matches.each do |match|
      concat_matches << match
    end

    return concat_matches
  end


  # but do without changing DB
  def matched_accounts(current_user_id, match_amount)
    matched = []
    # order by number of gets remove own account
    ordered = accounts.order(get_amount: :desc).where("user_id != :id", id: current_user_id)
    # select number current id gets
    selected = ordered.first(match_amount)

    ## CANT DO THIS BECAUSE MUST BE SAME ON REFRESH...
    selected.each { |account| account.get_amount = account.get_amount - 1 }
    return selected
  end

  def include_user?(user_id)
    accounts.pluck(:user_id).include?(user_id)
  end

  def find_user_account(user_id)
    accounts.find_by(user_id: user_id)
  end
end

private
  def entry_number(user_id, match_amount)
    count = 0
    accounts.each do |account|
      break if account.user_id == user_id
      count += 1
    end
    return count - match_amount
  end

  def account_slice(user_id, match_amount)
    first_index = entry_number(user_id, match_amount)
    accounts[first_index...(first_index + match_amount)]
  end
