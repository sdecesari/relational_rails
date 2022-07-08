class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :difficulty
      t.boolean :open

      t.timestamps
    end
  end
end
