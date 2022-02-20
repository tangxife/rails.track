module Mutations
  module Questions
    class DeleteQuestion < BaseMutation
      argument :ids, [ID], required: true
      field :questions, [Types::Interfaces::QuestionInterface], null: false

      def resolve(ids:)
        questions = Question.find(ids)
        questions.each(&:destroy!)

        { questions: questions }
      end
    end
  end
end
