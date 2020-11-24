# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning database"

Car.destroy_all
User.destroy_all

puts "create a user"
user = User.create!(email: "iliass@mail.com", password: "123456", first_name: "iliass", last_name: "ben")

puts "create a car"
car = Car.create(name: "Mercedes", description: "a louer", price: "29", model: "classe a", user: user)

puts "finished"


