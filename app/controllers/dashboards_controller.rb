class DashboardsController < ApplicationController
  def show
    @user = current_user
    @bookings = []
    current_user.bookings.each do |booking|
      @bookings << booking
    end

    current_user.offers.each do |offer|
      if offer.booked?
        @bookings << offer.booking
      end
    end

    @bookings.sort_by! { |booking| booking.offer.match_at }
  end
end
