class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hairdresser
 
  validates :message, :presence => {:message => 'Please type detail '}
end

