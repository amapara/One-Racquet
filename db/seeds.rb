

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

address_sample = ["160 Broadway, New York, NY 10038, USA","52 Fulton St, New York, NY 10038, USA"]
puts 'Creating 5 tennis courts...'
5.times do
  court = Court.new(
    address: address_sample.sample,
    price: rand(5..20)
    )
  court.save!
end

length_sample = [40,45,60,90]
puts 'Creating 20 offers...'
20.times do
  offer = Offer.new(
    match_at: DateTime.now + (rand(0..72)/24.0),
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


