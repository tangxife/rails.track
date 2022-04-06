class Tag < ApplicationRecord
  belongs_to :organization
  has_many :tag_joins
  has_many :questions, through: :tag_joins
end
