class Hairdresser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :reviews 
	has_many :users, through: :reviews
	has_many :pictures, :as => :imageable
	has_many :appointments


	has_many :service_categories
	has_many :rates, through: :service_categories

	accepts_nested_attributes_for :appointments, :reject_if => :all_blank, :allow_destroy => true


	belongs_to :category


 	mount_uploader :picture, HairdresserImageUploader


 	# for use with geocoder. Must match a column in the schema.
 	geocoded_by :salon_address
 	#callback
 	after_validation :geocode, :if => :salon_address_changed? #makes a call to google to fetch the coordinates from the address

 	# def full_salon_address
 	# 	address_line1 + city+ postcode
 	# end
end

