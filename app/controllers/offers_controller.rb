require 'json'
require 'open-uri'

class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
# !! When removing skip_before_action: take out :user_id from offer_params
# AND from simple_form at /offers/new  !!

  def new
    # @offer = Offer.find(params[:id])
    @offer = Offer.new
  end

  def index
    @offers = Offer.all
    if params[:query]
      @location = params[:query]
      @offers.each do |offer|
        offer.distance = distance(@location, offer.court.address)
        offer.save
      end
    else
      # @offers = Offer.all
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

  private

  def distance(user_location, offer_location)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user_location}&destinations=#{offer_location}&key=AIzaSyDNcY0wsmEOkpDBVeHAcgkYyiUfCLqWCC0"
    serialized = open(url).read
    details = JSON.parse(serialized)
    time = details['rows'].first['elements'].first['duration']['text']
    split = time.split(" ")
    return split[0]
  end
end
