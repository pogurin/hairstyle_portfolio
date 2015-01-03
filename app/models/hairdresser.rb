class Hairdresser < ActiveRecord::Base
 	include Tire::Model::Search
  include Tire::Model::Callbacks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :reviews 
	has_many :users, through: :reviews
	has_many :pictures, :as => :imageable
	has_many :appointments
	has_many :services

	belongs_to :category

 	mount_uploader :picture, HairdresserImageUploader




 	# for use with geocoder. Must match a column in the schema.
 	geocoded_by :salon_address
 	#callback
 	after_validation :geocode, :if => :salon_address_changed? #makes a call to google to fetch the coordinates from the address

 	# def full_salon_address
 	# 	address_line1 + city+ postcode
 	# end


  def self.search(params)
	  tire.search(load: true) do
	    query { string params[:query], default_operator: "AND" } if params[:query].present?
	  end
	end
end

