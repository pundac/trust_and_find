class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one_attached :photo

  def labor
    if self.product.product_type == 'carrelage'
      return 35*self.surface_area
    elsif self.product.product_type == 'parquet massif'
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
    return self.depose + self.labor + self.product.price_per_square_meter * self.surface_area + 50
  end

  def image_product
    if self.product.product_type == 'carrelage'
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT3-xxRrjmHG-R_mzJDld-8ExnYx9GVx66YTg&usqp=CAU'
    elsif self.product.product_type == 'parquet massif'
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSEQjKk61mtDGcVQc8sWAnYp13sMjrez2IH7RBlRDZGPldffmc8Xp9EHlmEvp4&usqp=CAc'
    else
      return 'https://www.plancheravenue.com/wp-content/uploads/2019/11/renover-parquet-stratifie-1030x687.jpg'
    end 
  end 
end

