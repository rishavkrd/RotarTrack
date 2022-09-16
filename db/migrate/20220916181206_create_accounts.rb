class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.integer :UIN
      t.text :FirstName
      t.text :LastName
      t.integer :PhoneNumber
      t.text :Email
      t.belongs_to :Status

      t.timestamps
    end
  end
end
