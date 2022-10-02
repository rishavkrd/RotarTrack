class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :Title
      t.text :Description
      t.date :Date
      t.time :Time
      t.text :Location
      t.integer :Points
      t.references :EventType, null: false, foreign_key: true

      t.timestamps
    end
  end
end
