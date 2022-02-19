class CandidateComment < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  validates :amount, presence: true
end
