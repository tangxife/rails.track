class QuestionTemplate < ApplicationRecord
  belongs_to :organization
  has_many :reference_checks

  validates_presence_of :title
  validates_uniqueness_of :title, scope: :organization_id
end
