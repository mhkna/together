require 'rails_helper'

RSpec.describe Account, type: :model do
  subject {
    described_class.new(username: 'mjk123', match_amount: 4, user: User.new, round: Round.new)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a match_amount" do
      subject.match_amount = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has one user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "has one round" do
      assc = described_class.reflect_on_association(:round)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
