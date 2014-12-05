class Hairdresser < ActiveRecord::Base
	has_many :reviews 
	has_many :pictures,:as => :imageable

	belongs_to :category
end
