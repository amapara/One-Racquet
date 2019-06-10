class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :court

  validates :date, presence: true
  validates :time, presence: true
  validates :user, presence: true
  validates :court, presence: true
end
