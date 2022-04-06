module Mutations
  module Questions
    class UpdateQuestion < BaseMutation
      argument :inputs, [Types::Inputs::QuestionInput], required: true
      field :questions, [Types::Interfaces::QuestionInterface], null: false

      def resolve(input:)
        # organization = context[:current_resource].organization
        questions = []

        inputs.each do |input|
          question_attr = input.to_h.except(:order, :id)
          question = Question.find(input.to_h[:id])
          question.update!(question_attr)
          questions << question
        end

        {
          questions: questions
        }
      end
    end
  end
end
