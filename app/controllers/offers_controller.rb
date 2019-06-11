class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
# !! When removing skip_before_action: take out :user_id from offer_params
# AND from simple_form at /offers/new  !!

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
    @offer.user = current_user
    if @offer.save
    #no need for app/views/offers/create.html.erb
      redirect_to offers_path(@offer), notice: "Your offer was created!"
    else
      render 'new'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:date, :time, :length, :court_id)
  end
end
