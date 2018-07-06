class Round < ApplicationRecord

  has_many :accounts

  def account_slice(slice_number)
    accounts[slice_number]
  end

  def comments(username)
    accounts.find_by(username: username).comments.pluck(:text)[0] #0 temp to get first
  end

  private

end
