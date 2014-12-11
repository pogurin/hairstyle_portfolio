class Picture < ActiveRecord::Base
	belongs_to :hairdresser
	has_and_belongs_to_many :categories
	belongs_to :imageable, :polymorphic => true 
	
end
