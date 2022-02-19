class Candidate < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :reference_checks, dependent: :destroy
  has_many :candidata_comments, dependent: :destroy

  # scope :filter_by_name, ->(name) { where('candidates.name like ?', "%#{name}%") }
  # scope :filter_by_refchk_progress, lambda { |progress|
  #   result = all.joins(:reference_checks)
  #   # result = result.where()
  #   result = result.where(:reference_checks, { progress: progress })
  #   result
  # }
end
