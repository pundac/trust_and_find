class RenameFieldsInBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :date, :starts_at
    rename_column :bookings, :product_type, :floor_type
    rename_column :bookings, :surface, :surface_area
    add_column :bookings, :ends_at, :date
  end
end
