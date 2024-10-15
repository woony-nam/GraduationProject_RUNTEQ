class Post < ApplicationRecord
  # Association
  belongs_to :user

  # Validation
  validates :title, presence: true
  validates :sake_name, presence: true
  validates :taste, presence: true, inclusion: { in: 1..5 }
end
