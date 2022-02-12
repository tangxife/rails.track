# frozen_string_literal: true

module Types
  class CandidateType < Types::BaseObject
    field :id, ID, null: false
    field :cid, String
    field :name, String, null: false
    field :email, String, null: false
    field :area_code, String
    field :phone, String
    field :now_rog_name, String
    field :now_industry, String
    field :memo, String
    field :organization_id, Integer, null: false
    field :user_id, Integer, null: false
    field :language, Integer, null: false
    field :deleted_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
