class AddPointsToPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :points, :Points, :integer
  end
end
