class OffersController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    # @offer = Offer.find(params[:id])
    @offer = Offer.new
  end

  def index

    if params[:query] != "" && params[:datetimes] != ""
      @offers = Offer.all.select { |offer| offer.court.address == params[:query] }
      @offers.select { |offer| offer.date == params[:datetimes] }
    elsif params[:query] != ""
      @offers = Offer.all.select { |offer| offer.court.address == params[:query] }
    elsif params[:datetimes] != ""
      @offers = Offer.all.select { |offer| offer.date == params[:datetimes] }
    else
      @offers = Offer.all
    end
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
  end

  private

  def offer_params
      params.require(:offer).permit(:date, :time, :length, :user_id, :court_id, :offers_search)
  end
end
