class Reply < ApplicationRecord

  belongs_to :comment
  belongs_to :micropost
  belongs_to :user

  validates :content, presence: true
  validates :comment, presence: true
  validates :user, presence: true
  validates :micropost, presence: true
end
