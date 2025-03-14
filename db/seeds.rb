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

spaces = [
  {
    name: "Cozy Studio",
    description: "A cozy studio in the heart of the city",
    address: "12 Baker Street, London, UK",
    price: 100,
    user_id: tina.id
  },
  {
    name: "Spacious Loft",
    description: "A spacious loft with a view",
    address: "45 Kensington High Street, London, UK",
    price: 150,
    user_id: charles.id
  },
  {
    name: "Modern Condo",
    description: "A modern condo with all the amenities",
    address: "78 Rue de Rivoli, Paris, France",
    price: 200,
    user_id: tina.id
  },
  {
    name: "Rustic Cabin",
    description: "A rustic cabin in the woods",
    address: "101 Forest Rd, Toronto, ON",
    price: 75,
    user_id: charles.id
  },
  {
    name: "Beach House",
    description: "A beach house with a view of the ocean",
    address: "202 Ocean Blvd, Toronto, ON",
    price: 250,
    user_id: tina.id
  },
  {
    name: "City Apartment",
    description: "A city apartment with a view of the skyline",
    address: "22 Boulevard Haussmann, Paris, France",
    price: 175,
    user_id: charles.id
  },
  {
    name: "Luxury Villa",
    description: "A luxury villa with a pool",
    address: "9 Promenade des Anglais, Nice, France",
    price: 300,
    user_id: tina.id
  },
  {
    name: "Mountain Chalet",
    description: "A mountain chalet with a view of the mountains",
    address: "33 Avenue Jean Médecin, Nice, France",
    price: 125,
    user_id: charles.id
  },
  {
    name: "Historic Townhouse",
    description: "A historic townhouse in the city center",
    address: "14 Rue de la République, Lyon, France",
    price: 225,
    user_id: tina.id
  },
  {
    name: "Seaside Cottage",
    description: "A seaside cottage with a view of the sea",
    address: "88 Quai Saint-Antoine, Lyon, France",
    price: 100,
    user_id: charles.id
  },
  {
    name: "Country Farmhouse",
    description: "A country farmhouse with a view of the countryside",
    address: "5 Rue Alphonse Karr, Étretat, France",
    price: 150,
    user_id: tina.id
  },
  {
    name: "Lake House",
    description: "A lake house with a view of the lake",
    address: "19 Avenue Nungesser et Coli, Étretat, France",
    price: 175,
    user_id: charles.id
  }
]

puts "Creating spaces..."
Space.create!(spaces)

loft_collection = Unsplash::User.find('tina501').collections.first

puts "Attaching photos..."
Space.all.each do |space|
  photo_url = loft_collection.photos.sample.urls.regular
  file = URI.parse(photo_url).open
  space.photo.attach(io: file, filename: "space.jpg", content_type: "image/jpg")
end
