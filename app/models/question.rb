class Question < ApplicationRecord
  has_many :template_questions
  has_many :question_templates, through: :template_questions
  has_many :tag_joins, as: :tagable
  has_many :tags, through: :tag_joins
end
