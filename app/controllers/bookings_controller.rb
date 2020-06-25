class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @step1 = params.dig(:surface_area).blank?
    @step2 = !@step1 && params.dig(:product).blank?
    @step3 = !params.dig(:product).blank?
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
    build_booking_with_params

  end

  def intervention_schedueles
    build_booking_with_params
  end

  private

  def build_booking_with_params
    @booking = Booking.new
    @booking.surface_area =  params[:surface_area]
    @booking.floor_type =  params[:product]
    @product =Product.find_by(product_type: params[:new_product])
    @booking.product = @product
  end

end
