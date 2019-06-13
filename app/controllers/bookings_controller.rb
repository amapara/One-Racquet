class BookingsController < ApplicationController

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end


  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.offer = @offer
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end

end
