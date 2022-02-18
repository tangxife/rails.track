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
      argument :ref_chk_progress, String, required: false
    end

    field :candidate, CandidateType, null: true do
      argument :id, ID, required: false
    end

    field :count_candidate_by_progress, GraphQL::Types::JSON, null: false

    def user(id: nil)
      object.users.find(id)
    end

    def candidates(name: nil, ref_chk_progress: nil)
      candidates = object.candidates.includes(:reference_checks)

      unless ref_chk_progress.nil?
        case ref_chk_progress
        when 'draft'
          candidates = candidates.joins(:reference_checks)
                                 .where('reference_checks.progress <= ?', RefChkProgress::DRAFT.id.to_s)
        when 'unopend'
          candidates = candidates.joins(:reference_checks)
                                 .where(reference_checks: { progress: RefChkProgress::MAIL_SENDED.id })
        when 'unresgistered'
          candidates = candidates.joins(:reference_checks)
                                 .where(reference_checks: { progress: RefChkProgress::MAIL_OPENED.id })
        when 'unanswered'
          candidates = candidates.joins(:reference_checks)
                                 .where('? < reference_checks.progress and reference_checks.progress <= ?',
                                        RefChkProgress::MAIL_OPENED.id.to_s, RefChkProgress::ANSWERED.id.to_s)
        end
      end

      candidates = candidates.where('candidates.name like ?', "%#{name}%") unless name.nil?
      candidates
    end

    def candidate(id: nil)
      object.candidates.includes(:user).find(id)
    end

    def count_candidate_by_progress
      # todo 把 1 和 2 的加起来返回
      object.candidates.joins(:reference_checks).group(:progress).count
    end
  end
end
