class Picture < ActiveRecord::Base
	attr_accessor :remove_image
	belongs_to :hairdresser
	has_and_belongs_to_many :categories
	belongs_to :imageable, :polymorphic => true 
	
	mount_uploader :picture, PictureUploader

# before_destroy :remember_image
#   after_destroy :remove_img

# 	protected
#   def remember_image
#     @image_name = self[:image]
#   end

#   def remove_img
#     File.delete("#{Rails.root}/public/uploads/picture/picture/#{@image_name}")
#     File.delete("#{Rails.root}/public/uploads/picture/picture/thumb_#{@image_name}")
#   end
end

