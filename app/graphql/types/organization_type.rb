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
    field :user, UserType, null: false do
      argument :id, ID, required: false
    end

    field :candidates, [CandidateType], null: true do
      argument :name, String, required: false
      argument :ref_chk_progress, Integer, required: false
    end

    field :candidate, CandidateType, null: true do
      argument :id, ID, required: false
    end

    def user(id: nil)
      object.users.find(id)
    end

    def candidates(name: nil, ref_chk_progress: nil)
      candidates = object.candidates

      unless ref_chk_progress.nil?
        candidates = candidates.joins(:reference_checks)
                               .where(reference_check: { progress: ref_chk_progress })
      end

      candidates = candidates.where('name like ?', "%#{name}%") unless name.nil?

      # if !name.nil?
      #   candidates = candidates.where('name like ?', "%#{name}%") unless name.nil?
      # elseif !ref_chk_progress.nil?
      #    candidates = candidates.joins(:reference_checks).where(reference_check: { progress: ref_chk_progress })
      #   else
      #
      #   end
      candidates
    end

    def candidate(id: nil)
      object.candidates.includes(:user).find(id)
    end
  end
end
