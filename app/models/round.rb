class Round < ApplicationRecord
  has_many :accounts

  def account_names
    accounts.pluck(:username).each_slice(5).to_a
  end

  def comments(username)
    accounts.find_by(username: username).comments.pluck(:text)[0] #0 temp to get first
  end
end
