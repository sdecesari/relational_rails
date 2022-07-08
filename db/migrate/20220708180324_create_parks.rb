class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.boolean :cost
      t.integer :daily_visitors

      t.timestamps
    end
  end
end
