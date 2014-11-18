# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobarbaz",
             password_confirmation: "foobarbaz",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(3)
50.times do |i|
  total = 100 + rand(50)
  pfat = 10 + rand(10)
  fat = total * pfat /100
  lean = total - fat
  spooftime = i.days.ago
  date = spooftime.to_formatted_s(:rfc822)
  users.each { |user| user.weights.create!(total: total, pfat:pfat, fat:fat, lean:lean, date:date, created_at:spooftime) }
end