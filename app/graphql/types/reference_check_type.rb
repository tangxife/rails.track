# frozen_string_literal: true

module Types
  class ReferenceCheckType < Types::BaseObject
    # field :id, ID, null: false
    # field :candidate_id, Integer
    # field :user_id, Integer
    field :answer_deadline, GraphQL::Types::ISO8601Date, null: false
    field :recommender_settings, [RecommenderSettingType], null: false
    field :progress, Integer, null: false

    def recommender_settings
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        ReferenceCheck.where(id: ids).includes(:recommender_settings).each do |ref_chk|
          loader.call(ref_chk.id, ref_chk.recommender_settings)
        end
      end
    end
  end
end
