module Mutations
  module Candidates
    class Add < BaseMutation
      argument :input, Types::Inputs::CandidateInput, required: true

      field :candidate, Types::CandidateType, null: false

      def resolve(input:)
        current_user = context[:current_resource]
        p "候補者登録 user: #{current_user.inspect} candidate ..."

        candidate_attr = input.to_h.except(:reference_check)
                              .merge(organization: current_user.organization)
        reference_check_attr =input.to_h[:reference_check].merge(user: current_user)

        rst = ActiveRecord::Base.transaction do
          candidate = current_user.candidates.create!(candidate_attr)
          candidate.reference_check.create!(reference_check_attr)
          candidate
        end

        {candidate: rst}
      end
    end
  end
end
