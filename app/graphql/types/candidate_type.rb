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
    # field :deleted_at, GraphQL::Types::ISO8601DateTime
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :organization_id, ID, null: false
    field :user_id, ID, null: false
    field :reference_checks, [ReferenceCheckType], null: false
    field :candidate_comments, [CandidateCommentType], null: true
    
    def reference_checks
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |ids, loader|
        Candidate.where(id: ids).each do |candidate|
          loader.call(candidate.id, candidate.reference_checks)
        end
      end
    end

  end
end
