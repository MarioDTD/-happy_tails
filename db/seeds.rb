# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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