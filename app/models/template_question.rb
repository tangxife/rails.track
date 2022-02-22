class TemplateQuestion < ApplicationRecord
  belongs_to :question_template
  belongs_to :question
end
