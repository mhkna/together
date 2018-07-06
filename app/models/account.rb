class Account < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :comments, dependent: :destroy
  validates :username, :website, presence: true

  
end
