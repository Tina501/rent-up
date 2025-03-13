# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

User.destroy_all
Space.destroy_all


tina = User.create!(email: "tina@example.com", password: "password")
charles = User.create!(email: "charles@example.com", password: "password")

loft_collection = Unsplash::User.find('tina501').collections.first

space1 = Space.create!(
  name: "Cozy Studio",
  description: "A cozy studio in the heart of the city",
  address: "123 Main St, Toronto, ON",
  price: 100,
  user: tina
)

photo_url = loft_collection.photos[0].urls.regular

file = URI.parse(photo_url).open
space1.photo.attach(io: file, filename: "space.jpg", content_type: "image/jpg")

space2 = Space.create!(
  name: "Spacious Loft",
  description: "A spacious loft with a view",
  address: "456 Queen St, Toronto, ON",
  price: 150,
  user: charles
)

photo_url = loft_collection.photos[1].urls.regular
file = URI.parse(photo_url).open
space2.photo.attach(io: file, filename: "space.jpg", content_type: "image/jpg")

space3 = Space.create!(
  name: "Modern Condo",
  description: "A modern condo with all the amenities",
  address: "789 King St, Toronto, ON",
  price: 200,
  user: tina
)

photo_url = loft_collection.photos[2].urls.regular
file = URI.parse(photo_url).open
space3.photo.attach(io: file, filename: "space.jpg", content_type: "image/jpg")


space4 = Space.create!(
  name: "Rustic Cabin",
  description: "A rustic cabin in the woods",
  address: "101 Forest Rd, Toronto, ON",
  price: 75,
  user: charles
)

photo_url = loft_collection.photos[3].urls.regular
file = URI.parse(photo_url).open
space4.photo.attach(io: file, filename: "space.jpg", content_type: "image/jpg")
