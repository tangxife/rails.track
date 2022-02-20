# frozen_string_literal: true

module Types
  class NarrativeQuestionType < Types::BaseObject
    implements Types::Interfaces::QuestionInterface

    field :answer_example0, String
    field :answer_example1, String
  end
end
