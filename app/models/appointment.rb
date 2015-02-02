class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hairdresser
 
	attr_accessor :file

  validates :message, :presence => {:message => 'Please type detail '}
end

