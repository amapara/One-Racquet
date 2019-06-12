class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :court

  validates :user, presence: true
  validates :court, presence: true
end
