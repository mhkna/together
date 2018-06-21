class Account < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :comments, dependent: :destroy
  before_save :website_is_ig
  validates :username, presence: true

  def website_is_ig
    self.website = "instagram"
  end

  # def like_and_comment
  #   round.account_names
  # end
end
