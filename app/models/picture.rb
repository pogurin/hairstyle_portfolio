class Picture < ActiveRecord::Base
	belongs_to :hairdresser
	belongs_to :category
	belongs_to :imageable, :polymorphic => true 
end
