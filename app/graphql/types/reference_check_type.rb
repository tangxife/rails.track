# frozen_string_literal: true

module Types
  class ReferenceCheckType < Types::BaseObject
    # field :id, ID, null: false
    # field :candidate_id, Integer
    # field :user_id, Integer
    # field :progress, Integer
    field :answer_deadline, GraphQL::Types::ISO8601Date, null: false
    field :recommender_settings, [RecommenderSettingType], null: false
  end
end
