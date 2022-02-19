class CandidateComment < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  validates :content, presence: true
end
