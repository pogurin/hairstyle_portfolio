class Inquiry
  include ActiveModel::Model
 
  attr_accessor :name, :email, :hairdresser_email, :message
 
  validates :name, :presence => {:message => 'Please type your Name'}
  validates :message, :presence => {:message => 'Please type detail '}
end
