class CreateResponces < ActiveRecord::Migration[6.0]
  def change
    create_table :responces do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
    add_index :responces, [:user_id, :board_id, :created_at]
  end
end