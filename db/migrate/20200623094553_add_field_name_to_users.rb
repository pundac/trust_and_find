class AddFieldNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
  end
end
