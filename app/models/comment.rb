class Comment < ApplicationRecord
  attr_accessor :comment_group
  belongs_to :account
  validates :text, length: { maximum: 120 }
end
