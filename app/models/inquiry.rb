class Inquiry
  include ActiveModel::Model
 
  attr_accessor :name, :email, :message
 
  validates :name, :presence => {:message => 'Please type your Name'}
  validates :email, :presence => {:message => 'Please type your email'}
  validates :message, :presence => {:message => 'Please type detail '}
end
