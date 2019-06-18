class Court < ApplicationRecord
  has_many :offers

  validates :address, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end

