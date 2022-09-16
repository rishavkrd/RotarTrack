class AddAccountToSignup < ActiveRecord::Migration[6.1]
  def change
    add_reference :signups, :account, null: false, foreign_key: true
  end
end
