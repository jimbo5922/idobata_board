class Board < ApplicationRecord
  belongs_to :user
  has_many :responces
  has_many :board_category_relations
  has_many :categories, through: :board_category_relations
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 100 }
end