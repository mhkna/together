class Account < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :comments
  before_save :website_is_ig
  validates :handle, presence: true

  def website_is_ig
    self.website = "instagram"
  end
end
