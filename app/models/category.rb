class Category < ActiveRecord::Base
	has_many :hairdressers
	has_many :pictures,:as => :imageable 

end
