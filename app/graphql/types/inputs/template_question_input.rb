module Types
  module Inputs
    class TemplateQuestionInput < Types::BaseInputObject
      argument :question_template_id, Integer, required: true
      argument :question_id, Integer, required: true
      argument :order, Integer, required: false
      argument :question, Types::Inputs::QuestionInput, required: false
    end
  end
end

