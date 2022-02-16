class Candidate < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :reference_check
end
