# frozen_string_literal: true

module Types
  class QuestionTemplateType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    # field :language, Integer, null: false
  end
end
