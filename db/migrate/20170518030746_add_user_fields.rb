class AddUserFields < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :document, :string, null: false
    add_column :users, :document_type, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :lastname, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean, default: false
  end
end
