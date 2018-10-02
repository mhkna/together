class Comment < ApplicationRecord
  attr_accessor :comment_group
  belongs_to :account
end
