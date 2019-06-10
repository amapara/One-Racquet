class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :offer, presence: true
  validates :user, presence: true
end
