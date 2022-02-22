# frozen_string_literal: true

module Types
  class QuestionTemplateType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :template_questions, [Types::TemplateQuestionType], null: true
  end
end
