class BookingsController < ApplicationController

  def new

  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.new
    raise
    params ?
    @booking.surface_area = ????
    # @product => retrouver le product grace aux params

    
  end

  def update
  end

  def edit
  end
end
