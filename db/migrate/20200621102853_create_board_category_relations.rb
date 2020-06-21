class CreateBoardCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :board_category_relations do |t|
      t.references :board, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
