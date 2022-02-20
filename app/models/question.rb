class Question < ApplicationRecord
  has_many :template_questions
  has_many :question_templates, through: :template_questions
end
