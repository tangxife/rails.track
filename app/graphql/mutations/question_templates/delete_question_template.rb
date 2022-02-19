module Mutations
  module QuestionTemplates
    class DeleteQuestionTemplate < BaseMutation
      argument :template_id, ID, required: true, description: 'Id of Question Template.'
      field :question_template, Types::QuestionTemplateType, null: false, description: 'Question Template.'

      def resolve(template_id:)
        question_template = QuestionTemplate.find(template_id)
        question_template.destroy!

        {
          question_template: question_template
        }
      end
    end
  end
end
