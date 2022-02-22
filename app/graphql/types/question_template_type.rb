# frozen_string_literal: true

module Types
  class QuestionTemplateType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :template_questions, [Types::TemplateQuestionType], null: true

    def template_questions
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        QuestionTemplate.where(id: ids).includes(:template_questions).each do |question_template|
          loader.call(question_template.id, question_template.template_questions)
        end
      end
    end
  end
end
