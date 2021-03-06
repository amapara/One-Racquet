class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :court
  has_one :booking

  validates :user, presence: true
  validates :court, presence: true

  def booked?
    booking.present?
  end

  def book_offer

    @offer.booking.present? == true
  end

end
