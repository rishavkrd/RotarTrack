class AddAuthenticationToAccount < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :account, null: false, foreign_key: true
  end
end
