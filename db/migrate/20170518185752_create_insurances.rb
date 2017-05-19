class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :insurances do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.timestamps null: false
    end

    add_reference :insurances, :vehicle, foreign_key: true, index: true
    add_reference :insurances, :rate, foreign_key: true, index: true
  end
end
