class ReferenceCheck < ApplicationRecord
  belongs_to :candidate
  belongs_to :user
  belongs_to :question_template

  has_many :recommender_settings, dependent: :destroy
end
