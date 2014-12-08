class Hairdresser < ActiveRecord::Base
	attr_accessor :email, :password, :password_confirmation #needed for password attribute as we are not working with sorcery for hairdresser currently

	has_many :reviews 
	has_many :users, through: :reviews
	has_many :pictures,:as => :imageable

	belongs_to :category

	validates :password, presence: true
  validates :email, uniqueness: true
end


