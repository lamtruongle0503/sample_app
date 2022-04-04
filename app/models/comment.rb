class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :body, presence: true
  validates :body, length: { minimum: 5 }

  def destroy
    update(deleted_at: Time.zone.now)
  end
end
