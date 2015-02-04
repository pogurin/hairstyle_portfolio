class Picture < ActiveRecord::Base
	attr_accessor :remove_image
	belongs_to :hairdresser
	has_and_belongs_to_many :categories
	belongs_to :imageable, :polymorphic => true 
	
	mount_uploader :picture, PictureUploader


end

