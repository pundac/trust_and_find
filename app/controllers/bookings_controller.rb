class BookingsController < ApplicationController
  include ActionView::Helpers::NumberHelper
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
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    @booking.price_cents = @booking.total * 100# @booking.product.price_per_square_meter * @booking.surface_area * 100
    authorize @booking
    if @booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: "Réalisation d'un #{@booking.product.product_type} sur #{@booking.surface_area} m2 ",
          # images: [teddy.photo_url],
          amount: @booking.price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: booking_url(@booking),
        cancel_url: booking_url(@booking)
      )
      @booking.update(checkout_session_id: session.id)
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @step6 = true
  end

  def confirmation
    build_booking_with_params
    authorize @booking
    @step4 = true
  end

  def intervention_schedueles
    build_booking_with_params
    authorize @booking
    @step5 = true
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
    params.require(:booking).permit(:surface_area, :product_id, :floor_type, :starts_at, :ends_at, :price_cents)
  end
end
