class QuestionTemplate < ApplicationRecord
  belongs_to :organization
  belongs_to :reference_check

  validates_presence_of :title
  validates_uniqueness_of :title, scope: :organization_id
end
