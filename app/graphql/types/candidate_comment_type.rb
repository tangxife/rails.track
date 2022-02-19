# frozen_string_literal: true

module Types
  class CandidateCommentType < Types::BaseObject
    field :id, ID, null: false
    # field :candidate_id, Integer
    # field :user_id, Integer
    field :user, String, null: false
    field :content, String, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
