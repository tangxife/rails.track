# frozen_string_literal: true

module Types
  class CandidateType < Types::BaseObject
    description 'candidate info'

    field :id, ID, null: false
    field :cid, String
    field :name, String, null: false
    field :email, String, null: false
    field :area_code, String
    field :phone, String
    field :now_org_name, String
    field :now_industry, String
    field :memo, String
    field :language, Integer, null: false
    field :deleted_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :organization, String, null: false

    def organization
      object.organization.name
    end

    field :user, String, null: false

    def user
      object.user.name
    end
  end
end
