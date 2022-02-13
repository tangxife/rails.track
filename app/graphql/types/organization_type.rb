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
  end
end
