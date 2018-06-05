class Round < ApplicationRecord
  has_many :accounts

  def account_names
    accounts.pluck(:username).each_slice(5).to_a
  end

end
