class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  has_many :replies

  validates :content, presence: true
  validates :user, presence: true
  validates :micropost, presence: true
end
