class Category < ActiveRecord::Base
	has_many :hairdressers
	#has_many :pictures,:as => :imageable 
	has_and_belongs_to_many :pictures
end
