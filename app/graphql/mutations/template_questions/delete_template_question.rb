module Mutations
  module TemplateQuestions
    class DeleteTemplateQuestion < BaseMutation
      argument :inputs, [Types::Inputs::TemplateQuestionInput], required: true
      field :template_questions, [Types::TemplateQuestionType], null: false

      def resolve(inputs:)
        template_questions = []

        inputs.each do |input|
          template_question = TemplateQuestion.where(question_template_id: input.to_h[:question_template_id],
                                                     question_id: input.to_h[:question_id]).first
          template_question.destroy
          template_questions << template_question
        end

        {
          template_questions: template_questions
        }
      end
    end
  end
end
