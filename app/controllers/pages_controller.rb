class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if URI(request.referer).path.match(/\/bookings\/\d+/)
      flash[:alert] = "Coming soon.." # Enlever plus tard
    end
  end
end
