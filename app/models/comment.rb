class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  belongs_to  :parent, class_name: 'Comment', optional: true
  has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  acts_as_tree order: 'created_at DESC'
  
  validates :content, presence: true
  validates :user, presence: true
  validates :micropost, presence: true
end
