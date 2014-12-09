# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(
	first_name: "Gabriel", 
	last_name: "R", 
	email: "gabrielr@live.ca", 
	password: "dog", 
	password_confirmation: "dog"
	)

Hairdresser.create!(
	first_name: "Hair", 
	last_name: "Dresser", 
	email: "hair@example.com", 
	password: "123", 
	password_confirmation: "123",
	career: "Stylist",
	salon_address: "1 Queen St, Toronto",
	salon_url: "www.google.com",
	personal_message: "I love color"
	)

Category.create!(name: "Short Hair")
Category.create!(name: "Long Hair")
Category.create!(name: "Dyed Hair")
Category.create!(name: "Curly Hair")
Category.create!(name: "Straight Hair")
Category.create!(name: "Blonde Hair")

$i = 0
while $i < 100  do

	   Picture.create(
	  :hairdresser_id   => 1,
	  :category_id    => (1 + rand(5)),
	  :imageable_id => 'blah blah',
	  :imageable_type => 'Hairdresser',
	  :source => 'shorthair.png'
	 #  	if :category_id==1
	 #  	:source => 'shorthair.png',
		# elsif :category_id==2
	 #  	:source => 'longhair.png',
	 #  	elsif :category_id==3
	 #  	:source => 'dyedhair.png',
	 #  	elsif :category_id==4
	 #  	:source => 'curlyhair.png',
	 #  	elsif :category_id==5
	 #  	:source => 'straighthair.png',
	 # 	 elsif :category_id==6
	 #  	:source => 'blondehair.png'
	 #  end	


	)
   $i +=1
end

    # t.integer  "hairdresser_id"
    # t.integer  "category_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "imageable_id"
    # t.string   "imageable_type"

