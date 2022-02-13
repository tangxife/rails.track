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
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :users, UserType.connection_type, null: false

    def users
      object.users.order(:created_at)
    end

    field :candidates, CandidateType.connection_type, null: true

    def candidates
      object.candidates.includes(:user).order(:created_at)
    end
  end
end
