

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

court_list =[
  ["Waldschulallee 45, 14055 Berlin, Germany","Tennis club SCC Berlin e.V."],
  ["Kopenicker Landstraße 186, 12437 Berlin, Germany","Treptower Teufel Tennis Club e.V."],
  ["Roelckestrase 105, 13088 Berlin, Germany", "TCW Tennis Center GmbH tennis courts"],
  ["Cantianstrase 24, 10437 Berlin, Germany", "TSG Break '90 e.V." ],
  ["Treskowallee 209, 12459 Berlin, Germany", "Tennis Club Blue Gold Wuhlheide Berlin e.V."],
  ["Franziusweg 114/128, 12307 Berlin, Germany", "TC White - Yellow Lichtenrade e.V."],
  ["Melchiorstraße 19, 10179 Berlin, Germany", "TC Berlin Albert Gutzmann e.V."],
  ["Blucherstraße 46, 10961 Berlin, Germany", "Tennis in Friedrichshain-Kreuzberg"],
  ["Kruppstraße 16, 10557 Berlin, Germany", "Tennis-Club Tiergarten e. V. (Schwarz-Weiß)"],
  ["Paradestraße 28-32, 12101 Berlin, Germany", "Berliner Tennis Club 1904 Grün-Gold e.V."]
]

puts 'Creating 10 tennis courts...'
court_list.each do |address, name|
  court = Court.new(
    address: address,
    price: rand(5..20),
    name: name
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
