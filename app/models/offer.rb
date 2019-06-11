class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :court

  validates :date, presence: true
  validates :time, presence: true
  validates :user, presence: true
  validates :court, presence: true

 include PgSearch
  pg_search_scope :search_by_date_and_time,
    against: [ :date, :time ],
    using: {
      tsearch: { prefix: true }
    }

end
