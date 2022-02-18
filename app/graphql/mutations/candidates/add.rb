module Mutations
  module Candidates
    class Add < BaseMutation
      argument :input, Types::Inputs::CandidateInput, required: true
      field :candidate, Types::CandidateType, null: false

      def resolve(input:)
        user = context[:current_resource]
        candidate_attr = input.to_h.except(:reference_check).merge(organization: user.organization)
        user = User.find(candidate_attr[:user_id]) unless candidate_attr[:user_id].nil?

        reference_check_attr = input.to_h[:reference_check].except(:recommender_settings)
                                    .merge(user: user, progress: RefChkProgress::NULL.id)
        recommender_setting_attrs = input.to_h[:reference_check][:recommender_settings]

        rst = ActiveRecord::Base.transaction do
          candidate = user.candidates.create!(candidate_attr)
          reference_check = candidate.reference_checks.create!(reference_check_attr)
          reference_check.recommender_settings.create!(recommender_setting_attrs)
          candidate
        end

        { candidate: rst }
      end
    end
  end
end
