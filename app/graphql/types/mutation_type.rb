module Types
  class MutationType < Types::BaseObject
    field :register, mutation: Mutations::Register, authenticate: false,
          description: '新規アカウント発行'
    field :add_candidate, mutation: Mutations::Candidates::Add, description: '候補者登録'
  end
end
