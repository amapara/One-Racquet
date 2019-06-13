require 'json'
require 'open-uri'
require 'date'

class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
# !! When removing skzip_before_action: take out :user_id from offer_params
# AND from simple_form at /offers/new  !!

  def new
    # @offer = Offer.find(params[:id])
    @offer = Offer.new
  end

    def index

    start_date = params[:start_date]
    start_split = start_date.split("")
    start_time = "#{start_split[-5]}#{start_split[-4]}".to_i

    end_date = params[:end_date]
    end_split = end_date.split("")
    end_time = "#{end_split[-5]}#{end_split[-4]}".to_i

    @offers = Offer.where(match_at: start_date..end_date)

    @offer_filt = []

    @offers.each do |offer|
      time = offer.match_at.hour
      if time < end_time && time > start_time
        @offer_filt << offer
      end
    end

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
      redirect_to dashboard_path, notice: "Your offer was created!"
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
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user_location}&destinations=#{offer_location}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    serialized = open(url).read
    details = JSON.parse(serialized)
    time = details['rows'].first['elements'].first['duration']['text']
    split = time.split(" ")
    return split[0]
  end



end
