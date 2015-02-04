class Review < ActiveRecord::Base
	# attr_accessor :remove_review

	validates :comment, presence: true
	
	belongs_to :hairdresser
	belongs_to :user
end
