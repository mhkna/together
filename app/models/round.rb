class Round < ApplicationRecord
  has_many :accounts
  attr_accessor :matches

  def matchezzz(account_id, match_amount)
    high = high_matches(account_id, match_amount)
    return high if match_amount == high.count
    accounts_needed = match_amount - high.count
    low = low_matches(account_id, accounts_needed)
    return high + low
  end

  def include_user?(user_id)
    accounts.pluck(:user_id).include?(user_id)
  end

  def find_user_account(user_id)
    accounts.find_by(user_id: user_id)
  end

  private

    def high_matches(account_id, match_amount)
      higher_accounts(account_id).first(match_amount)
    end

    def low_matches(account_id, accounts_needed)
      lower_accounts(account_id).first(accounts_needed)
    end

    def higher_accounts(account_id)
      self.accounts.where('id > ?', account_id)
    end

    def lower_accounts(account_id)
      self.accounts.where('id < ?', account_id)
    end
end
