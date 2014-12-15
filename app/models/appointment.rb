class Appointment < ActiveRecord::Base
  belongs_to :users
  belongs_to :hairdressers
 
  validates :message, :presence => {:message => 'Please type detail '}
end

