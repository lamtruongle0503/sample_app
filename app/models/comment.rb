class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  has_many :replies
  validates :content, presence: true
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
