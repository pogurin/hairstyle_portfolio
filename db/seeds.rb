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

# Hairdresser.create!( 
# 	first_name: "Hair", 
# 	last_name: "Dresser", 
# 	email: "hair@example.com", 
# 	password: "123", 
# 	password_confirmation: "123",
# 	career: "Stylist",
# 	salon_address: "1 Queen St, Toronto",
# 	salon_url: "www.google.com",
# 	personal_message: "I love color"
# 	)

Category.create!(name: "Short Hair")
Category.create!(name: "Long Hair")
Category.create!(name: "Dyed Hair")
Category.create!(name: "Curly Hair")
Category.create!(name: "Straight Hair")
Category.create!(name: "Blonde Hair")

$i = 0
while $i < 100  do
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
