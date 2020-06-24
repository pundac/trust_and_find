class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
      raise
    else
      render 'new'
    end
  end

  def confirmation
    @booking = Booking.new
    @booking.surface_area =  params[:surface_area]
    @booking.floor_type =  params[:product]
    # @booking.product.product_type = params[:product][:new_product]
    # @booking.product.price_per_square_meter = params[:product][:price_per_square_meter]
  end 

  def intervention_schedueles
  end
  
end
