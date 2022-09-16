class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|

      t.timestamps
    end
  end
end
