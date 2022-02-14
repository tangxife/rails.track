class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable, :omniauthable

  include GraphqlDevise::Concerns::Model

  belongs_to :organization
  has_many :candidates

  enum :role, {
    owner: 0,
    member: 1
  }
end
