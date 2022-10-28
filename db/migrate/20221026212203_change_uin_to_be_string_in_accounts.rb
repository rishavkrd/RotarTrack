class ChangeUinToBeStringInAccounts < ActiveRecord::Migration[6.1]
  def change
  	change_column :accounts, :UIN, :text
  end
end
