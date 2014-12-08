class Review < ActiveRecord::Base
	validates :comment, presence: true
	
	belongs_to :hairdresser
	belongs_to :user
end
