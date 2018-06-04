class Round < ApplicationRecord
  has_many :accounts

  def hash_accounts
    text_hash = {}
    accounts.each do |account|
      text_hash[account] = []
      account.comments.each do |comment|
        text_hash[account] << comment
      end
    end
    text_hash
  end

end
