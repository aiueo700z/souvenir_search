class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
   # belongs_toで1:Nを関連付ける
  validates :comment, presence: true
end
