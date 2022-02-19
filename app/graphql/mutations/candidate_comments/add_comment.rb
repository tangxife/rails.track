module Mutations
  module CandidateComments
    class AddComment < BaseMutation
      argument :candidate_id, ID, required: true, description: 'Id of candidate.'
      argument :content, String, required: true, description: 'Comment content.'

      field :candidate_comment, Types::CandidateCommentType, null: false, description: 'Candidate comment.'

      def resolve(candidate_id:, content:)
        current_user = context[:current_resource]

        rst = ActiveRecord::Base.transaction do
          candidate = Candidate.find(candidate_id)
          candidate_comment = candidate.candidate_comments.create!(user: current_user, content: content)
          candidate_comment
        end

        { candidate_comment: rst }
      end
    end
  end
end
