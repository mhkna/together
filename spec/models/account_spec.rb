require 'rails_helper'

RSpec.describe Account, type: :model do
  subject {
    Account.new(username: 'mjk123', match_amount: 4, user: User.new, round: Round.new)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a username" do
    subject.username = nil
    expect(Account.new(match_amount: 4)).to_not be_valid
  end

  it "is not valid without a match_amount" do
    subject.match_amount = nil
    expect(Account.new(username: "mjk123")).to_not be_valid
  end
end
