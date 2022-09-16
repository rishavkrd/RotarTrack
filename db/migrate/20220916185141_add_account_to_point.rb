class AddAccountToPoint < ActiveRecord::Migration[6.1]
  def change
    add_reference :points, :account, null: false, foreign_key: true
  end
end
