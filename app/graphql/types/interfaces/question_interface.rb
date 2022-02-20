# frozen_string_literal: true

module Types
  module Interfaces
    module QuestionInterface
      include Types::BaseInterface

      orphan_types Types::NarrativeQuestionType, Types::RadioButtonQuestionType

      field :id, ID, null: false
      field :title, String, null: false
      field :purpose, String
      field :is_recommended, Boolean
      field :type, String, null: false
      field :order, Integer, null: true

      definition_methods do
        # Determine what object type to use for `object`
        def resolve_type(object, context)
          case object
          when NarrativeQuestion
            Types::NarrativeQuestionType
          when RadioButtonQuestion
            Types::RadioButtonQuestionType
          else
            raise "Unexpected Question: #{object.inspect}"
          end
        end
      end
    end
  end
end
