

require 'faker'
require 'date'


skill_sample = ["high","medium","low"]
puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "password",
    skill: "medium",
    )
  user.save!
end

# User.new(
#   name: "Gary Oak",
#   email: "fakeaddress19072019@gmail.com",
#   password: "ashSux",
#   skill: "god"
#   )

court_list =[
  {
    name: "Tennis club SCC Berlin e.V.",
    address: "Waldschulallee 45, 14055 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805158/pzxsem92xaovqrf5vtgq.jpg",
    price: rand(5..20)
  },
  {
    name: "Treptower Teufel Tennis Club e.V.",
    address: "Kopenicker Landstrase 186, 12437 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805200/z97pehfq1zc5caa831vm.webp",
    price: rand(5..20)
  },
  {
    name: "TCW Tennis Center GmbH tennis courts",
    address: "Roelckestrase 105, 13088 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805194/jwpogdor050iq49vdual.jpg",
    price: rand(5..20)
  },
  {
    name: "TSG Pause '90 e.V." ,
    address: "Cantianstrase 24, 10437 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805189/a2naxvoe6c1iearrfdud.jpg",
    price: rand(5..20)
  },
  {
    name: "Tennis Club Blue Gold Wuhlheide Berlin e.V.",
    address: "Treskowallee 209, 12459 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805177/yf8b0fgkxhhrxg3o6o7h.jpg",
    price: rand(5..20)
  },
  {
    name: "TC White - Yellow Lichtenrade e.V.",
    address: "Franziusweg 114/128, 12307 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805171/hiuzf6v7bje6lvs3jspb.jpg",
    price: rand(5..20)
  },
  {
    name: "TC Berlin Albert Gutzmann e.V.",
    address: "Melchiorstrase 19, 10179 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805165/romub4zdubsjeok9csry.png",
    price: rand(5..20)
  },
  {
    name: "Tennis in Friedrichshain-Kreuzberg",
    address: "Blucherstrase 46, 10961 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805154/cyaiktfpbtlsfxlbatbu.jpg",
    price: rand(5..20)
  },
  {
    name: "Tennis-Club Tiergarten e. V. (Schwarz-Weiß)",
    address: "Kruppstrase 16, 10557 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805148/mx5wofksrpcf7zqnwpfe.jpg",
    price: rand(5..20)
  },
  {
    name: "Berliner Tennis Club 1904 Grün-Gold e.V.",
    address: "Paradestrase 28-32, 12101 Berlin, Germany",
    remote_photo_url: "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805139/k3siinmqscchnrmbxmmt.jpg",
    price: rand(5..20)
  }
]

# unused_images_array = [
#   "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805133/wqqhjo5vwjf3ncsrlspt.jpg",
#   "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805128/g9qq5vrrjygkc1h9dvbo.jpg",
#   "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805122/tyzgumjtbadlze2pouz9.gif",
#   "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805109/qwxrpblzfh3xz0kbolsh.jpg",
#   "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805103/wbmua6y8afbbnjtdsher.jpg",
#   "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805056/aww40fdey0mzsfotjhta.jpg",
# ]

puts 'Creating 10 tennis courts...'
Court.create!(court_list)

length_sample = [40,45,60,90]
date = Time.now
puts 'Creating 10 offers...'
15.times do
  offer = Offer.new(
    match_at: DateTime.new(date.year, date.month, date.day + (rand(3)), rand(9..12)),
    length: length_sample.sample,
    user: User.all.sample,
    court: Court.all.sample,
    )
  offer.save!
end

puts 'Creating 1 bookings...'
1.times do
  booking = Booking.new(
    offer: Offer.all.sample,
    user: User.all.sample
    )
  booking.save!
end
