# frozen_string_literal: true

module Types
  class RecommenderSettingType < Types::BaseObject
    field :id, ID, null: false
    # field :reference_check_id, Integer
    field :relation, Integer
    field :period, Integer
    field :num, Integer
  end
end
