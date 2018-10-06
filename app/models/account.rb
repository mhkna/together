class Account < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :comments, dependent: :destroy
  validates :username, :match_amount, presence: true
  before_save :set_get_amount
  # before_save { self.website = "instagram" }
  # accepts_nested_attributes_for :comments, reject_if: lambda { |attributes| attributes[:text].blank? }

  private
    def set_get_amount
      self.get_amount = match_amount
    end
end
