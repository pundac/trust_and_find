class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :confirmation, :intervention_schedueles]
  def new
    @booking = Booking.new
    authorize @booking
    @step1 = params.dig(:surface_area).blank?
    @step2 = !@step1 && params.dig(:product).blank?
    @step3 = !params.dig(:product).blank?
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user # Ne pas oublier de changer pour que ce soit le current user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def confirmation
    build_booking_with_params
    authorize @booking
  end

  def intervention_schedueles
    build_booking_with_params
    authorize @booking
  end

  def show 
    @booking = Booking.find(params[:id])
  end 

  private

  def build_booking_with_params
    @booking = Booking.new
    @booking.surface_area = params[:surface_area]
    @booking.floor_type = params[:product]
    @product = Product.find_by(product_type: params[:new_product])
    @booking.product = @product
  end

  def booking_params
    params.require(:booking).permit(:surface_area, :product_id, :floor_type, :starts_at, :ends_at)
  end
end
