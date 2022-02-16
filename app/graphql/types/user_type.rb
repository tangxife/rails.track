# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    # field :organization_id, Integer
    field :name, String
    field :email, String
    field :phone, String
    field :department, String
    field :role, Integer, null: false
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :organization, String, null: false
    field :candidates, [CandidateType], null: true
    field :candidate, CandidateType, null: true do
      argument :id, ID, required: true
    end

    def organization
      object.organization.name
    end

    def candidate(id:)
      object.candidates.find(id)
    end
  end
end
