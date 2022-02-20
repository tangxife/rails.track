class TemplateQuestion < ApplicationRecord
  belongs_to :question_templates
  belongs_to :question
end
