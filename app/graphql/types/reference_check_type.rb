# frozen_string_literal: true

module Types
  class ReferenceCheckType < Types::BaseObject
    # field :id, ID, null: false
    # field :candidate_id, Integer
    # field :user_id, Integer
    field :answer_deadline, GraphQL::Types::ISO8601Date, null: false
    # todo 解决 N + 1
    field :recommender_settings, [RecommenderSettingType], null: false
    field :progress, Integer, null: false
  end
end
