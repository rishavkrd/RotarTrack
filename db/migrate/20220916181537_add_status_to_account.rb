class AddStatusToAccount < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :status, null: false, foreign_key: true
  end
end
