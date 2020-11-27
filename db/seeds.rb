# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

puts "Cleaning database"

Car.destroy_all
User.destroy_all

puts "Create a user"
# user = User.create!(email: "iliass@mail.com", password: "123456", first_name: "iliass", last_name: "ben")

photo_urls = [
"https://www.gims.swiss/sites/default/files/styles/image_3_2/public/gims/auto/12_p18_0842_a3_rgb.jpg?itok=IfrJvV3p",
"https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/AC_Cobra_289_%281963%29_Solitude_Revival_2019_IMG_1738.jpg/800px-AC_Cobra_289_%281963%29_Solitude_Revival_2019_IMG_1738.jpg",
"https://imgr1.auto-motor-und-sport.de/James-Bond-007-Aston-Martin-DB5-169Gallery-93ee490a-1602293.jpg",
"https://s1.cdn.autoevolution.com/images/models/FERRARI_Portofino-M-2020_main.jpg",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-bentley-continental-gt-v8-coupe-110-1561493228.jpg?crop=0.718xw:0.587xh;0.135xw,0.232xh&resize=1200:*",
"https://cdn.luxe.digital/media/2020/04/30200348/best-electric-cars-luxury-luxe-digital.jpg",
"https://cdn.prod.www.manager-magazin.de/images/4eb3f23e-0001-0004-0000-000000121409_w996_r1.77_fpx65.92_fpy44.97.jpg",
"https://pict1.reezocar.com/images/360/autoscout24.fr/RZCATSFR2ECDF2576DE4/CHEVROLET-CORVETTE-00.jpg",
"https://img4.autodeclics.com/photo_article/80455/11599/1200-L-nitro-incluse.jpg",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-land-rover-range-rover-sport-mmp-1-1595270011.jpg?crop=0.997xw:0.787xh;0,0.137xh&resize=1200:*"
]

address = [
  "Route de la Capite 70, 1253 Vandœuvres, Suisse",
  "Schluhmattstrasse 55, 3920 Zermatt, Suisse",
  "Via Gioacchino Respini, 6600 Locarno, Suisse",
  "Schönriedstrasse 74, 3792 Saanen, Suisse",
  "Avenue des Champs-Montants 2, 2074 Neuchâtel, Suisse",
  "Route du Signal 2, 1018 Lausanne, Suisse",
  "Denkmalstrasse 4, 6002 Luzern, Suisse",
  "Zürichbergstrasse 221, 8044 Zürich, Suisse",
  "Marktstrasse 8, 8501 Frauenfeld, Suisse",
  "Via Nova 15, 7017 Flims Dorf, Suisse"
]

10.times do
  user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  puts "Create a car"

  file = URI.open(photo_urls.first)
  file_address = address.first
  car = Car.new(name: Faker::Vehicle.make, description: "A louer", price: Faker::Commerce.price(range: 20..70, as_string: true), model: Faker::Vehicle.model, user: user, address: file_address)
  car.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
  car.save!
  photo_urls.delete_at(0)
  address.delete_at(0)

end
puts "Done"
