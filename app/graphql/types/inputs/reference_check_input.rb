module Types
  module Inputs
    class ReferenceCheckInput < Types::BaseInputObject
      argument :answer_deadline, GraphQL::Types::ISO8601Date, required: true
    end
  end
end
