class Comment < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 3, maximum: 150 }

  belongs_to :user
  belongs_to :post
end
