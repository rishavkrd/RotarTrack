class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.references :event, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.boolean :Pickup

      t.timestamps
    end
  end
end
