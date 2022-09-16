class AddEventToSignup < ActiveRecord::Migration[6.1]
  def change
    add_reference :signups, :event, null: false, foreign_key: true
  end
end
