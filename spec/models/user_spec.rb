require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(username: "mjk123", password: "some_password", email: "john@doe.com") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a username longer than 20 characters" do
      subject.username = "123456789012345678901"
      expect(subject).to_not be_valid
    end

    it "is valid with a username of 20 characters" do
      subject.username = "12345678901234567890"
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a password of 5 characters" do
      subject.password = "12345"
      expect(subject).to_not be_valid
    end

    it "is not valid with an email that is not formatted properly" do
      subject.email = "aklsdfatyahoo.com"
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
