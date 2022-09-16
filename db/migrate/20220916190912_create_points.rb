class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.references :account, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
