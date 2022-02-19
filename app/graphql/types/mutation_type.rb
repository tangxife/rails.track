module Types
  class MutationType < Types::BaseObject
    field :register, mutation: Mutations::Register, authenticate: false, description: '新規アカウント発行'

    field :add_candidate, mutation: Mutations::Candidates::Add, description: '候補者登録。'
    field :update_candidate, mutation: Mutations::Candidates::Update, description: '候補者情報更新。'
    field :delete_candidate, mutation: Mutations::Candidates::Delete, description: '候補者削除。'

    field :add_candidate_comment, mutation: Mutations::CandidateComments::AddComment
    field :update_candidate_comment, mutation: Mutations::CandidateComments::UpdateComment
    field :delete_candidate_comment, mutation: Mutations::CandidateComments::DeleteComment
  end
end
