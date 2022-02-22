module Mutations
  module TemplateQuestions
    class UpdateTemplateQuestion < BaseMutation
      argument :inputs, [Types::Inputs::TemplateQuestionInput], required: true
      field :template_questions, [Types::TemplateQuestionType], null: false

      def resolve(inputs:)
        question_template = QuestionTemplate.find(inputs[0].to_h[:question_template_id])
        old_template_questions = question_template.template_questions

        ActiveRecord::Base.transaction do
          old_template_questions.each(&:destroy)

          inputs.each do |input|
            template_question_attr = input.to_h.except(:question_template_id, :question)
            question_template.template_questions.create!(template_question_attr)
          end
        end

        {
          template_questions: question_template.template_questions
        }
      end
    end
  end
end
