# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(
	first_name: "Test", 
	last_name: "User", 
	email: "test@example.com", 
	password: "123", 
	password_confirmation: "123"
	)

Hairdresser.create!(
	first_name: "Hair", 
	last_name: "Dresser", 
	email: "hair@example.com", 
	password: "123", 
	password_confirmation: "123",
	career: "stylist",
	salon_address: "1 Queens street, Toronto",
	salon_url: "www.google.com",
	personal_message: "I love color"
	)