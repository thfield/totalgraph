class ChangeDateFormatInWeights < ActiveRecord::Migration
  def up
    change_column :weights, :date, :datetime
  end

  def down
    change_column :weights, :date, :string
  end
end
