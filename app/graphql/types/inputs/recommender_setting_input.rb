module Types
  module Inputs
    class RecommenderSettingInput < Types::BaseInputObject
      argument :relation, Integer, required: false
      argument :period, Integer, required: false
      argument :num, Integer, required: true
    end
  end
end
