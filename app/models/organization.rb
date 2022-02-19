class Organization < ApplicationRecord
  has_many :users
  has_many :candidates
  has_many :question_templates
end
