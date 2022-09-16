class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.boolean :Pickup

      t.timestamps
    end
  end
end
