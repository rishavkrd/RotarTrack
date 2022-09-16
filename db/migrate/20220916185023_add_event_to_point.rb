class AddEventToPoint < ActiveRecord::Migration[6.1]
  def change
    add_reference :points, :event, null: false, foreign_key: true
  end
end
