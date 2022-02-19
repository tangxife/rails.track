class ReferenceCheck < ApplicationRecord
  belongs_to :candidate
  belongs_to :user
  has_many :recommender_settings, dependent: :destroy
  has_many :question_templates, dependent: :destroy
end
