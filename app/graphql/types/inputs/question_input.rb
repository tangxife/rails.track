module Types
  module Inputs
    class QuestionInput < Types::BaseInputObject
      argument :id, ID, required: false, description: 'Id of Question'
      argument :title, String, required: true
      argument :purpose, String, required: false
      argument :answer_example0, String, required: false
      argument :answer_example1, String, required: false
      argument :is_recommended, Boolean, required: false
      argument :type, Types::Enums::QuestionType, required: true
      argument :order, Integer, required: false, description: 'Ordder in Question Template.'
    end
  end
end
