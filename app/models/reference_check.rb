class ReferenceCheck < ApplicationRecord
  belongs_to :candidate
  belongs_to :user
end
