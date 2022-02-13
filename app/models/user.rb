class User < ApplicationRecord
  belongs_to :organization
  has_many :candidates
end
