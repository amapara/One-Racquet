class OffersController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    # @offer = Offer.find(params[:id])
    @offer = Offer.new
  end

  def index
    if params[:query]
      @offers = Offer.all.select { |offer| offer.court.address == params[:query]}
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
    # params.require(:user).permit(:date, :time, :length, :user_id, :court_id)
      params.require(:offer).permit(:date, :time, :length, :user_id, :court_id, :offers_search)
  end
end
