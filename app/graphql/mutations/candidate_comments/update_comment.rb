module Mutations
  module CandidateComments
    class UpdateComment < BaseMutation
      argument :comment_id, ID,  required: true, description: 'Id of comment.'
      argument :content, String, required: true, description: 'Comment content.'

      field :candidate_comment, Types::CandidateCommentType, null: false, description: 'Candidate comment.'

      def resolve(comment_id:, content:)
        current_user = context[:current_resource]

        rst = ActiveRecord::Base.transaction do
          candidate_comment = CandidateComment.find(comment_id)

          if current_user.id == candidate_comment.user_id
            candidate_comment.update!(content: content)
          end

          candidate_comment
        end

        { candidate_comment: rst }
      end
    end
  end
end
