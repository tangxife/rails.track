module Mutations
  module CandidateComments
    class DeleteComment < BaseMutation
      argument :comment_id, ID, required: true, description: 'Id of comment.'
      field :candidate_comment, Types::CandidateCommentType, null: false, description: 'Candidate comment.'

      def resolve(comment_id:)
        current_user = context[:current_resource]
        candidate_comment = CandidateComment.find(comment_id)
        candidate_comment.destroy! if current_user.id == candidate_comment.user_id

        {
          candidate_comment: candidate_comment
        }
      end
    end
  end
end
