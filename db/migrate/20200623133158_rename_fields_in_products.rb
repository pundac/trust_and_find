class RenameFieldsInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :name, :description
    rename_column :products, :price, :price_per_square_meter
  end
end
