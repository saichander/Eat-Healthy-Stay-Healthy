# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.first_or_create!(
  email: "test@gmail.com",
  password: "test12345",
  password_confirmation: "test12345",
  admin:true,
  dob: Date.today,
  gender: "male"
)

FoodItem.first_or_create!(item:"apple",
                quantity:"1",
                metrics: "piece",
                calories:"123")
