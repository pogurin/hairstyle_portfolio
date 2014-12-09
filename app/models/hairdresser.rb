class Hairdresser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :reviews 
	has_many :users, through: :reviews
	has_many :pictures,:as => :imageable

	belongs_to :category

 	mount_uploader :picture, HairdresserImageUploader

end


