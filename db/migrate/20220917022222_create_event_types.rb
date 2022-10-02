class CreateEventTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :event_types do |t|
      t.text :Type

      t.timestamps
    end
  end
end
