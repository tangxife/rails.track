# frozen_string_literal: true

module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :organization_id, Integer, null: false
    field :title, String, null: false
    field :purpose, String
    field :answer_example0, String
    field :answer_example1, String
    field :is_recommended, Boolean
    field :type, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
