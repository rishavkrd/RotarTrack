class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.text :Value

      t.timestamps
    end
  end
end
