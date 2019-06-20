class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :offer, presence: true
  validates :user, presence: true

 after_create :send_mail

  def send_mail
    UserMailer.with(booking: self).booking.deliver_now
  end
end
