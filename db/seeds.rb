# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'date'

skill_sample = ["high","medium","low"]
puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "password",
    skill: skill_sample.sample,
    )
  user.save!
end

puts 'Creating 5 tennis courts...'
5.times do
  court = Court.new(
    address: Faker::Address.full_address,
    price: rand(5..20)
    )
  court.save!
end

length_sample = [40,45,60,90]
puts 'Creating 20 offers...'
20.times do
  offer = Offer.new(
    date: Date.today + rand(1..3),
    time: rand(9..19),
    length: length_sample.sample,
    user: User.all.sample,
    court: Court.all.sample,
    )
  offer.save!
end

puts 'Creating 10 bookings...'
10.times do
  booking = Booking.new(
    offer: Offer.all.sample,
    user: User.all.sample
    )
  booking.save!
end


