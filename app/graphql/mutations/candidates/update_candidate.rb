module Mutations
  module Candidates
    class UpdateCandidate < BaseMutation
      argument :input, Types::Inputs::CandidateInput, required: true

      field :candidate, Types::CandidateType, null: false

      def resolve(input:)
        candidate_attr = input.to_h.except(:reference_check)
        candidate = Candidate.find(candidate_attr[:id])

        reference_check_attr = input.to_h[:reference_check].except(:recommender_settings)
        recommender_setting_attrs = input.to_h[:reference_check][:recommender_settings]

        rst = ActiveRecord::Base.transaction do
          reference_check = candidate.reference_checks.first

          reference_check.recommender_settings.each(&:destroy!)
          reference_check.recommender_settings.create!(recommender_setting_attrs)
          reference_check.update!(reference_check_attr)
          candidate.update!(candidate_attr.except(:id))
          candidate
        end

        { candidate: rst }
      end
    end
  end
end
