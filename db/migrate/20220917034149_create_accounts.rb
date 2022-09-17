class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.integer :UIN
      t.text :FirstName
      t.text :LastName
      t.integer :PhoneNumber
      t.text :Email
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
