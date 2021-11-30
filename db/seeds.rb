require 'faker'

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

5.times do
  Pet.create!(
    name: Faker::Name.first_name,
    animal: "Dog",
    breed: Faker::Creature::Dog.breed,
    color: Faker::Color.color_name,
    fee: rand(100..500),
    age: rand(1..15),
    sterilised: ["Yes", "No"].sample,
    image_url: "https://placedog.net/640/480?random",
    adopted: [true, false].sample,
    shelter: happy_pets
  )
end

5.times do
  Pet.create!(
    name: Faker::Name.first_name,
    animal: "Dog",
    breed: Faker::Creature::Cat.breed,
    color: Faker::Color.color_name,
    fee: rand(100..500),
    age: rand(1..15),
    sterilised: ["Yes", "No"].sample,
    image_url: "https://placekitten.com/g/200/300",
    adopted: [true, false].sample,
    shelter: happy_pets
  )
end

puts 'Pets created'
