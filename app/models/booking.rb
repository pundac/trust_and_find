class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one_attached :photo

  def labor
    if self.product.product_type == 'carrelage'
      return 35*self.surface_area
    elsif self.product.product_type == 'Parquet massif'
      return 40*self.surface_area
    else
      return 30*self.surface_area
    end
  end

  def depose
    if self.floor_type == 'carrelage'
      return 50*self.surface_area
    elsif self.floor_type == 'parquet massif'
      return 40*self.surface_area
    elsif self.floor_type == 'parquet stratifier'
      return 30*self.surface_area
    else
      return 0*self.surface_area
    end
  end

  def total
    return self.labor + self.product.price_per_square_meter * self.surface_area + 50
  end

end

