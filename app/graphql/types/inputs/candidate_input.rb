module Types
  module Inputs
    class CandidateInput < Types::BaseInputObject
      argument :id, Integer, required: false, description: "Id of candidate"
      argument :name, String, required: true
      argument :email, String, required: false
      argument :area_code, String, required: false
      argument :phone, String, required: false
      argument :now_org_name, String, required: false
      argument :now_industry, String, required: false
      argument :memo, String, required: false
      # argument :language, Integer # todo
      argument :user_id, Integer, required: true
      argument :reference_check, ReferenceCheckInput, required: true
    end
  end
end
