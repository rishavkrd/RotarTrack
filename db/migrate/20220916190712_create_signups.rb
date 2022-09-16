class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.references :account, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :Signup

      t.timestamps
    end
  end
end
