class OffersController < ApplicationController

skip_before_action :authenticate_user!
  def index
    @offers = Offer.all
  end
 
  def new
    @offer = Offer.find(params[:id])
  end

  def create
  end

  private

  def offer_params
    params.require(:user).permit(:name, :skill, :booking)
  end

end
