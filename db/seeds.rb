# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "db seed running"

# seeds for employee table

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

seeds for criteria_values table

dataKriteria = [
  {
    kriteria: "C1",
    keterangan: "Tanggung Jawab",
    bobot_nilai: 3
  },
  {
    kriteria: "C2",
    keterangan: "Pengetahuan Pekerjaan",
    bobot_nilai: 2
  },
  {
    kriteria: "C3",
    keterangan: "Kerja Sama",
    bobot_nilai: 2
  },
  {
    kriteria: "C4",
    keterangan: "Kualitas Pekerjaan",
    bobot_nilai: 3
  }
]

dataKriteria.each do |data| 
  CriteriaValue.create(
    kriteria: data[:kriteria],
    bobot_nilai: data[:bobot_nilai],
    keterangan: data[:keterangan]
  )
end

dataNilai = [
  {
    kriteria: "A",
    keterangan: "Sangat Baik",
    bobot_nilai: 4
  },
  {
    kriteria: "B",
    keterangan: "Baik",
    bobot_nilai: 3
  },
  {
    kriteria: "C",
    keterangan: "Cukup",
    bobot_nilai: 2
  },
  {
    kriteria: "D",
    keterangan: "Kurang",
    bobot_nilai: 1
  }
]

dataNilai.each do |data|
  PreferenceValue.create(
    kriteria: data[:kriteria],
    bobot_nilai: data[:bobot_nilai],
    keterangan: data[:keterangan]
  )
end

puts "db seed finish"
