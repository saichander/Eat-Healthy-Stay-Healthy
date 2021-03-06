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
User.first_or_create!(
  email: "seed@gmail.com",
  password: "seed12345",
  password_confirmation: "seed12345",
  admin:true,
  dob: Date.today,
  gender: "female"
)
FoodItem.first_or_create!(item:"chocolate",
                          quantity:"1",
                          metrics: "piece",
                          calories:"123")

FoodItem.first_or_create(item:"beer",
                         quantity:"1",
                         metrics: "piece",
                         calories:"123")
FoodItem.first_or_create!(item:"wine",
                          quantity:"1",
                          metrics: "piece",
                          calories:"123")
