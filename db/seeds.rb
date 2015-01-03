# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create!(
# 	first_name: "Gabriel", 
# 	last_name: "R", 
# 	email: "gabrielr@live.ca", 
# 	password: "dog", 
# 	password_confirmation: "dog"
# 	)
Hairdresser.destroy_all

Hairdresser.create!([
  {first_name: "Jamie",last_name: "Oliver" , email: "jamie@oliver.com", password: '12345678', salon_address: "301 Front St W, Toronto, ON, CANADA", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "Louise",last_name: "Henry", email: "louise@henry.com", password: '12345678', salon_address: "236 Adelaide Street West, Toronto, ON, Canada", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "Phil",last_name: "Michaels", email: "phil@michaels.com", password: '12345678', salon_address: "224 Adelaide St W, Toronto, ON, Canada", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "Clare",last_name: "Andrews", email: "clare@andrews.com", password: '12345678', salon_address: "14 Duncan St, Toronto, ON, Canada", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "Max",last_name: "O'Connor", email: "max@oconnor.com", password: '12345678', salon_address: "124 Ossignton Ave, Toronto, ON, Canada", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "Julie",last_name: "Peters", email: "julie@peters.com", password: '12345678', salon_address: "225 Ossington Ave, Toronto, ON, Canada", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "John",last_name: "Anderson", email: "john@anderson.com", password: '12345678', salon_address: "218 Adelaide St W, Toronto, ON, Canada", career: "18 years", personal_message: "I'm cool", available: true},
  {first_name: "Peter",last_name: "Philips", email: "peter@philips.com", password: '12345678', salon_address: "220 King St W, Toronto ON", career: "18 years", personal_message: "I'm cool"}
])

Category.create!(name: "Short Hair")
Category.create!(name: "Long Hair")
Category.create!(name: "Dyed Hair")
Category.create!(name: "Curly Hair")
Category.create!(name: "Straight Hair")
Category.create!(name: "Blonde Hair")

$i = 0
while $i < 30  do
	rand=(1 + rand(6))
	url=""
		if rand==1
	  	url = 'shorthair.png'
		elsif rand==2
	  	url = 'longhair.png'
	  	elsif rand==3
	  	url = 'dyedhair.png'
	  	elsif rand==4
	  	url = 'curlyhair.png'
	  	elsif rand==5
	  	url = 'straighthair.png'
	 	 elsif rand==6
	  	url = 'blondehair.png'
	  end	
	  p = Picture.create(
	  :hairdresser_id   => 1,
	  :imageable_id => 'blah blah',
	  :imageable_type => 'Hairdresser',
	  :source => url
		)
	  if rand==1
	  	p.categories << Category.find_by_name("Short Hair")
		elsif rand==2
	  	p.categories << Category.find_by_name("Long Hair")
	  	elsif rand==3
	  	p.categories << Category.find_by_name("Dyed Hair")
	  	elsif rand==4
	  	p.categories << Category.find_by_name("Curly Hair")
	  	p.categories << Category.find_by_name("Short Hair")
	  	elsif rand==5
	  	p.categories << Category.find_by_name("Straight Hair")
	  	p.categories << Category.find_by_name("Long Hair")
	 	 elsif rand==6
	  	p.categories << Category.find_by_name("Blonde Hair")
	  	p.categories << Category.find_by_name("Long Hair")
	  end
	
	  	
	  
	  

   $i +=1

end
