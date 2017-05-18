class CreateCoverages < ActiveRecord::Migration[5.0]
  def change
    create_table :coverages do |t|
      t.float :death
      t.float :medical
      t.float :inability
      t.float :transport
      t.string :currency

      t.timestamps null: false
    end
  end
end
