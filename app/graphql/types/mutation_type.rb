module Types
  class MutationType < Types::BaseObject
    field :register, mutation: Mutations::Register, authenticate: false, description: 'User Sign Up.'

    field :add_candidate, mutation: Mutations::Candidates::Add, description: 'Add Candidate.'
    field :update_candidate, mutation: Mutations::Candidates::Update, description: 'Update Candidate.'
    field :delete_candidate, mutation: Mutations::Candidates::Delete, description: 'Delete Candidate.'

    field :add_candidate_comment, mutation: Mutations::CandidateComments::AddComment, description: 'Add Candidate Comment.'
    field :update_candidate_comment, mutation: Mutations::CandidateComments::UpdateComment, description: 'Update Candidate Comment.'
    field :delete_candidate_comment, mutation: Mutations::CandidateComments::DeleteComment, description: 'Delete Candidate Comment.'

    field :add_question_templates, mutation: Mutations::QuestionTemplates::AddQuestionTemplate, description: 'Add Question Template.'
    field :update_question_templates, mutation: Mutations::QuestionTemplates::UpdateQuestionTemplate, description: 'Update Question Template.'
    field :delete_question_templates, mutation: Mutations::QuestionTemplates::DeleteQuestionTemplate, description: 'Delete Question Template.'
  end
end
