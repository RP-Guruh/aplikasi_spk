# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "db seed running"

10.times do
  Employee.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    gender: Faker::Gender.binary_type,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    position: Faker::Job.title,
    department: Faker::Job.field,
    salary: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    start_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
    employment_status: Faker::Job.employment_type
  )
end

puts "db seed finish"
