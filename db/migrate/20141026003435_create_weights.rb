class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :total
      t.integer :pfat
      t.integer :fat
      t.integer :lean
      t.references :user, index: true

      t.timestamps null: false
    end
  add_index :weights, [:user_id, :created_at]
  end
end
