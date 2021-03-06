class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :offers

  validates :name, presence: true
  validates :email, presence: true

  after_create :send_mail

  def send_mail
    puts "hi"
    UserMailer.with(user: self).welcome.deliver_now
  end

  def mail
    puts "hi"
    UserMailer.with(offer: self).booking.deliver_now
  end
end
