

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
  ["Waldschulallee 45, 14055 Berlin, Germany","Tennis club SCC Berlin e.V."],
  ["Kopenicker Landstrase 186, 12437 Berlin, Germany","Treptower Teufel Tennis Club e.V."],
  ["Roelckestrase 105, 13088 Berlin, Germany", "TCW Tennis Center GmbH tennis courts"],
  ["Cantianstrase 24, 10437 Berlin, Germany", "TSG Break '90 e.V." ],
  ["Treskowallee 209, 12459 Berlin, Germany", "Tennis Club Blue Gold Wuhlheide Berlin e.V."],
  ["Franziusweg 114/128, 12307 Berlin, Germany", "TC White - Yellow Lichtenrade e.V."],
  ["Melchiorstrase 19, 10179 Berlin, Germany", "TC Berlin Albert Gutzmann e.V."],
  ["Blucherstrase 46, 10961 Berlin, Germany", "Tennis in Friedrichshain-Kreuzberg"],
  ["Kruppstrase 16, 10557 Berlin, Germany", "Tennis-Club Tiergarten e. V. (Schwarz-Weiß)"],
  ["Paradestrase 28-32, 12101 Berlin, Germany", "Berliner Tennis Club 1904 Grün-Gold e.V."]
]

image_array =["https://res.cloudinary.com/dhladrgg9/image/upload/v1560805158/pzxsem92xaovqrf5vtgq.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805200/z97pehfq1zc5caa831vm.webp",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805194/jwpogdor050iq49vdual.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805189/a2naxvoe6c1iearrfdud.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805177/yf8b0fgkxhhrxg3o6o7h.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805171/hiuzf6v7bje6lvs3jspb.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805165/romub4zdubsjeok9csry.png",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805154/cyaiktfpbtlsfxlbatbu.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805148/mx5wofksrpcf7zqnwpfe.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805148/mx5wofksrpcf7zqnwpfe.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805139/k3siinmqscchnrmbxmmt.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805133/wqqhjo5vwjf3ncsrlspt.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805128/g9qq5vrrjygkc1h9dvbo.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805122/tyzgumjtbadlze2pouz9.gif",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805109/qwxrpblzfh3xz0kbolsh.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805103/wbmua6y8afbbnjtdsher.jpg",
  "https://res.cloudinary.com/dhladrgg9/image/upload/v1560805056/aww40fdey0mzsfotjhta.jpg",
]

puts 'Creating 10 tennis courts...'
court_list.each do |address, name|
  court = Court.new(
    address: address,
    price: rand(5..20),
    name: name,
    )
  court.remote_photo_url = image_array.sample
  court.save!
end



length_sample = [40,45,60,90]
date = Time.now
puts 'Creating 10 offers...'
15.times do
  offer = Offer.new(
    match_at: DateTime.new(date.year, date.month, date.day + (rand(3)), rand(15..19)),
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
