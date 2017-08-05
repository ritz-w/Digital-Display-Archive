class Comment < ApplicationRecord
  validates :body, presence: true
  validates :user, presence: true
  validates :project, presence: true
  validates :rating, numericality: { only_integer: true }
  after_create_commit { CommentUpdateJob.perform_later(self) }
  
  belongs_to :user
  belongs_to :project
  default_scope { order(created_at: :desc) }
end


