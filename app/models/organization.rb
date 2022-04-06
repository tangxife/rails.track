class Organization < ApplicationRecord
  has_many :users
  has_many :candidates
  has_many :question_templates
  has_many :questions
  has_many :tags
end
