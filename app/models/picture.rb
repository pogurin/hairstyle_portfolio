class Picture < ActiveRecord::Base
	has_and_belongs_to_many :categories

	belongs_to :imageable, :polymorphic => true 
	# imageable connects anything
	
	mount_uploader :picture, PictureUploader
end
