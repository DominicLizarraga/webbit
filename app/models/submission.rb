class Submission < ApplicationRecord

  include VotesCountable

  mount_uploader :submission_image, SubmissionImageUploader
  mount_uploader :submission_video, SubmissionImageUploader

  belongs_to :user
  belongs_to :community

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { maximum: 8000 }

  acts_as_votable



end
