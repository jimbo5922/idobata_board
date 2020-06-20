class Responce < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :content, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
end