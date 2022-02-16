module Types
  module Inputs
    class CandidateInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :email, String
      argument :area_code, String
      argument :phone, String
      argument :now_org_name, String
      argument :now_industry, String
      argument :memo, String
      # argument :language, Integer # todo
      # argument :user_id, Integer, required: true
      argument :reference_check, ReferenceCheckInput, required: true
    end
  end
end
