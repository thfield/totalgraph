class AddDateToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :date, :string
  end
end
