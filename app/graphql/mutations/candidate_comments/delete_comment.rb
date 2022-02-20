module Mutations
  module CandidateComments
    class DeleteComment < BaseMutation
      argument :ids, [ID], required: true, description: 'Id of comment.'
      field :candidate_comments, [Types::CandidateCommentType], null: false, description: 'Candidate comment.'

      def resolve(ids:)
        current_user = context[:current_resource]
        candidate_comments = CandidateComment.find(ids)
        res = []

        candidate_comments.each do |comment|
          comment.destroy! if current_user.id == comment.user_id
        end

        {
          candidate_comments: candidate_comments
        }
      end
    end
  end
end
