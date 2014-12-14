class Inquiry
  include ActiveModel::Model
 
  attr_accessor :name, :email, :hairdresser_email, :message
 
  validates :message, :presence => {:message => 'Please type detail '}
end
