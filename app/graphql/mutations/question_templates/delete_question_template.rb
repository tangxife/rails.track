module Mutations
  module QuestionTemplates
    class DeleteQuestionTemplate < BaseMutation
      argument :ids, [ID], required: true, description: 'Id of Question Template.'
      field :question_templates, [Types::QuestionTemplateType], null: false, description: 'Question Template.'

      def resolve(ids:)
        question_templates = QuestionTemplate.find(ids)
        question_templates.each(&:destroy!)

        {
          question_templates: question_templates
        }
      end
    end
  end
end
