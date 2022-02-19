# frozen_string_literal: true

module Types
  class CandidateCommentType < Types::BaseObject
    field :id, ID, null: false
    # field :candidate_id, Integer
    # field :user_id, Integer
    field :user, String, null: true
    field :content, String, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def user
      BatchLoader::GraphQL.for(object.user_id).batch do |user_ids, loader|
        User.where(id: user_ids).each do |user|
          loader.call(user.id, user.name || user.email)
        end
      end
    end
  end
end
