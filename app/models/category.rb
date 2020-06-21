class Category < ApplicationRecord
  has_many :board_category_relations, foreign_key: 'category_id'
  has_many :boards, through: :board_category_relations
end