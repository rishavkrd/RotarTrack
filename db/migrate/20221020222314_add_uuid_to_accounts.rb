class AddUuidToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :uuid, :text
  end
end
