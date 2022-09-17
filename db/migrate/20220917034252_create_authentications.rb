class CreateAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :authentications do |t|
      t.references :account, null: false, foreign_key: true
      t.text :password

      t.timestamps
    end
  end
end
