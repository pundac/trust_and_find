class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_in_path_for(resource)
    raise
    booking_url(Booking.last)
  end

  def after_sign_up_path_for(resource)
    raise
    booking_url(Booking.last)
  end
end
