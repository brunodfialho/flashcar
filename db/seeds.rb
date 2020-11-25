# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning database"

Car.destroy_all
User.destroy_all

puts "Create a user"
# user = User.create!(email: "iliass@mail.com", password: "123456", first_name: "iliass", last_name: "ben")

10.times do
  user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  puts "Create a car"
  car = Car.create(name: Faker::Vehicle.make, description: "A louer", price: Faker::Commerce.price(range: 20..70, as_string: true), model: Faker::Vehicle.model, user: user)
end
puts "Done"
