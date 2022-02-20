module Mutations
  module Questions
    class AddQuestion < BaseMutation
      argument :input, Types::Inputs::QuestionInput, required: true
      field :question, Types::Interfaces::QuestionInterface, null: false

      def resolve(input:)
        organization = context[:current_resource].organization
        question_attr = input.to_h.except(:order, :id)
        question = organization.questions.create!(question_attr)

        {
          question: question
        }
      end
    end
  end
end
