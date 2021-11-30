require 'faker'

Puts 'Destroying data'

Shelter.destroy_all
Pet.destroy_all

puts 'Creating shelters'

happy_pets = Shelter.create!(
  name: "SPCA",
  address: Faker::Address.street_address,
  contact: Faker::PhoneNumber.cell_phone,
  email:  Faker::Internet.email
)

puts "Shelter created"

puts 'Creating pets'

5.times do
  dog = Pet.new(
    name: Faker::Name.first_name,
    animal: "Dog",
    breed: Faker::Creature::Dog.breed,
    color: Faker::Color.color_name
    fee: rand(100..500)
    age: rand(1..15)
    sterilised: ["Yes", "No"].sample
    image_url: "https://placedog.net/640/480?random"
    adopted: [true, false].sample
  )
end

5.times do
  cat = Pet.new(
    name: Faker::Name.first_name,
    animal: "Dog",
    breed: Faker::Creature::Cat.breed,
    color: Faker::Color.color_name
    fee: rand(100..500)
    age: rand(1..15)
    sterilised: ["Yes", "No"].sample
    image_url: "https://placekitten.com/g/200/300"
    adopted: [true, false].sample
  )
end

puts 'Pets created'

puts "clearing users..."
User.destroy_all

puts "Creating normal user"
User.create!(
  email: 'john@gmail.com',
  password: '123123'
)
puts "Normal user created!"

puts "Creating admin user"
User.create!(
  email: 'paul@gmail.com',
  password: '123123',
  admin: true
)
puts "Admin user created"
