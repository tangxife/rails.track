module Mutations
  module QuestionTemplates
    class AddQuestionTemplate < BaseMutation
      argument :title, String, required: true, description: 'Question Template title.'

      field :question_template, Types::QuestionTemplateType, null: false, description: 'Add Question Template.'

      def resolve(title:)
        current_user = context[:current_resource]
        organization = current_user.organization

        rst = ActiveRecord::Base.transaction do
          question_template = organization.question_templates.create!(title: title)
          question_template
        end

        { question_template: rst }
      end
    end
  end
end
