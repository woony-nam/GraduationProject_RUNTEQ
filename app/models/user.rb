class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :posts, dependent: :destroy

  # Validation
  validates :username, presence: true, uniqueness: true
end
