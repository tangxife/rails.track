module Types
  module Enums
    class QuestionType < Types::BaseEnum
      value :NARRATIVE, value: 'NarrativeQuestion'
      value :RADIO_BUTTON, value: 'RadioButtonQuestion'
    end
  end
end
