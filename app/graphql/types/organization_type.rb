# frozen_string_literal: true

module Types
  class OrganizationType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String
    field :tel, String
    field :postal_code, String
    field :address, String
    field :contacts, String
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :users, [UserType], null: true
    field :candidates, [CandidateType], null: true

    field :user, UserType, null: false do
      argument :id, ID, required: false
    end

    def user(id: nil)
      object.users.find(id)
    end

    field :candidate, CandidateType, null: true do
      argument :id, ID, required: false
    end

    def candidate(id: nil)
      object.candidates.includes(:user).find(id)
    end
  end
end
