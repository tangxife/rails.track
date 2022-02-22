# frozen_string_literal: true

module Types
  class TemplateQuestionType < Types::BaseObject
    field :question_template_id, Integer, null: false
    field :question_id, Integer, null: false
    field :order, Integer
    field :question, Types::Interfaces::QuestionInterface, null: false

    def question
      BatchLoader::GraphQL.for(object.question_id).batch do |ids, loader|
        Question.where(id: ids).each do |question|
          loader.call(question.id, question)
        end
      end
    end
  end
end
