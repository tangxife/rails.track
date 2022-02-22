module Mutations
  module TemplateQuestions
    class UpdateTemplateQuestion < BaseMutation
      argument :inputs, [Types::Inputs::TemplateQuestionInput], required: true
      field :template_questions, [Types::TemplateQuestionType], null: false

      def resolve(inputs:)
        old_template_questions = TemplateQuestion.where(question_template_id: inputs[0].to_h[:question_template_id])

        ActiveRecord::Base.transaction do
          old_template_questions.each(&:destroy!)
          question_template = QuestionTemplate.find(inputs[0].to_h[:question_template_id])

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
