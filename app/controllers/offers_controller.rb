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

    @user = current_user

    dt = DateOptions.new(today: params[:today], tomorrow: params[:tomorrow], overmorrow: params[:overmorrow], time_range: params[:my_range])

    @offers = Offer.where(match_at: dt.dates)


    @offer_filt_one = []

    @offers.each do |offer|
      if offer.booked? == false
        @offer_filt_one << offer
      end
    end

    @offer_filt_two = []

    @offer_filt_one.each do |offer|
      if offer.user.skill == @user.skill
        @offer_filt_two << offer
      end
    end

    if @offer_filt_two.empty?
      @offer_filt_two = @offer_filt_one
    end

    if params[:query]
      @location = params[:query]
      @offer_filt_two.each do |offer|
        offer.distance = distance(@location, offer.court.address)
        offer.save
      end
    end

      @offer_filt_order = @offer_filt_two.sort_by { |x| x[:distance] }
  end


  def create
    match_at = DateTime.parse("#{params[:day]} #{params[:options]}-3")
    length = 60
    user = current_user
    court_id = params[:offer][:court_id]
    @offer = Offer.new(match_at: match_at, length: length, user: user, court_id: court_id)
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
    params.require(:offer).permit(:match_at, :length, :court_id)
  end

  def distance(user_location, offer_location)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user_location}&destinations=#{offer_location}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    serialized = open(url).read
    details = JSON.parse(serialized)
    time = details['rows'].first['elements'].first['duration']['text']
    split = time.split(" ")
    return split[0]
  end

end
