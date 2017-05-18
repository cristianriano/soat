class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :license, null: false

      t.string :category, null: false
      t.string :subcategory, null: false

      t.integer :age, null: true

      t.string :value_type, null: true
      t.integer :value, null: true

      t.timestamps null: false
    end

    add_index :vehicles, :license, unique: true
    add_reference :vehicles, :user, foreign_key: true, index: true
    add_reference :vehicles, :rate, foreign_key: true, index: true
  end
end
