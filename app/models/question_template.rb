class QuestionTemplate < ApplicationRecord
  belongs_to :organization
  has_many   :reference_checks
  has_many   :template_questions
  has_many   :questions, through: :template_questions

  validates_presence_of   :title
  validates_uniqueness_of :title, scope: :organization_id
end
