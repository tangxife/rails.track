module Mutations
  module QuestionTemplates
    class UpdateQuestionTemplate < BaseMutation
      argument :template_id, ID, required: true, description: 'Id of Question Template.'
      argument :title, String, required: true, description: 'Title of Question Template.'

      field :question_template, Types::QuestionTemplateType, null: false, description: 'Question Template.'

      def resolve(template_id:, title:)
        question_template = QuestionTemplate.find(template_id)
        question_template.update!(title: title)

        {
          question_template: question_template
        }
      end
    end
  end
end
