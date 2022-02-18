module Mutations
  module Candidates
    class Delete < BaseMutation
      argument :ids, [ID], required: true, description: "Id of candidates"

      field :candidates, [Types::CandidateType], null: false

      def resolve(ids:)
        candidates = Candidate.find(ids)
        candidates.each(&:destroy!)

        { candidates: candidates }
      end
    end
  end
end
