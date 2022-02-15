module Types
  class MutationType < Types::BaseObject
    field :register, mutation: Mutations::Register, authenticate: false,
          description: '新規アカウント発行'

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
