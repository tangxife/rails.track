module Mutations
  module TemplateQuestions
    class AddTemplateQuestion < BaseMutation
      argument :inputs, [Types::Inputs::TemplateQuestionInput], required: true
      field :template_questions, [Types::TemplateQuestionType], null: false

      def resolve(inputs:)
        question_template = QuestionTemplate.find(inputs[0].to_h[:question_template_id])

        inputs.each do |input|
          template_question_attr = input.to_h.except(:question_template_id, :question)
          question_template.template_questions.create!(template_question_attr)
        end

        {
          template_questions: question_template.template_questions
        }
      end
    end
  end
end
