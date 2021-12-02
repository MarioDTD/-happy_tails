require 'pry-byebug'
require 'faker'
require 'open-uri'
require 'nokogiri'

puts 'Destroying data'

Shelter.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating normal user"
User.create!(
  email: 'john@gmail.com',
  password: '123123'
)
puts "Normal user created!"

puts "Creating admin user"
admin_user = User.create!(
  email: 'paul@gmail.com',
  password: '123123',
  admin: true
)
puts "Admin user created"


puts 'Creating shelters'

happy_pets = Shelter.create!(
  name: "SPCA",
  address: Faker::Address.street_address,
  contact: Faker::PhoneNumber.cell_phone,
  email:  Faker::Internet.email,
  user: admin_user
)

puts "Shelter created"

puts 'Creating pets'

dog_urls = [
  'https://images.unsplash.com/photo-1508946558729-87abab0492de?crop=entropy&amp;cs=tinysrgb&amp;fit=crop&amp;fm=jpg&amp;h=400&amp;ixid=MnwxfDB8MXxyYW5kb218MHx8ZG9nfHx8fHx8MTYzODQxODk5NA&amp;ixlib=rb-1.2.1&amp;q=80&amp;utm_campaign=api-credit&amp;utm_medium=referral&amp;utm_source=unsplash_source&amp;w=600',
  'https://images.unsplash.com/photo-1477884213360-7e9d7dcc1e48?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8ZG9nfHx8fHx8MTYzODQxOTUzOQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8ZG9nfHx8fHx8MTYzODQxOTU5NQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1617129724623-84f1d2fd78f3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8ZG9nfHx8fHx8MTYzODQyMDM1MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1558788353-f76d92427f16?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8ZG9nfHx8fHx8MTYzODQxOTY0Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600'
]

cat_urls = [
  'https://images.unsplash.com/photo-1545529468-42764ef8c85f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2F0fHx8fHx8MTYzODQxOTc3Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1598188306155-25e400eb5078?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2F0fHx8fHx8MTYzODQxOTgwMg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2F0fHx8fHx8MTYzODQxOTgxNQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1602556818918-064af3b32844?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2F0fHx8fHx8MTYzODQxOTgyNA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600',
  'https://images.unsplash.com/photo-1621238282106-827d0261f0cf?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2F0fHx8fHx8MTYzODQxOTg1NA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600'
]

5.times do |n|
  dog_file = URI.open(dog_urls[n])

  dog = Pet.new(
    name: Faker::Name.first_name,
    animal: "Dog",
    breed: Faker::Creature::Dog.breed,
    color: Faker::Color.color_name,
    fee: rand(100..500),
    age: rand(1..15),
    sterilised: ["Yes", "No"].sample,
    gender: ["Female", "Male"].sample,
    overview: Faker::Creature::Dog.meme_phrase,
    shelter: happy_pets
  )
  dog.photos.attach(io: dog_file, filename: 'dog.png', content_type: 'image/png')
  dog.save!
end

puts 'Dogs created'

5.times do |n|
  cat_file = URI.open(cat_urls[n])
  cat = Pet.new(
    name: Faker::Name.first_name,
    animal: "Cat",
    breed: Faker::Creature::Cat.breed,
    color: Faker::Color.color_name,
    fee: rand(100..500),
    age: rand(1..15),
    sterilised: ["Yes", "No"].sample,
    gender: ["Female", "Male"].sample,
    overview: ["Shy but opens up with cuddles", "Sweet baby who loves people", "Has some skin issues but is the sweetest thing"].sample,
    shelter: happy_pets
  )
  cat.photos.attach(io: cat_file, filename: 'cat.png', content_type: 'image/png')
  cat.save!
end

puts 'Cats created'
