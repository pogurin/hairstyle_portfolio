class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :hairdressers, through: :reviews

  validates :password, length: {minimum: 3}, on: :create 
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true, on: :create

  mount_uploader :picture, UserImageUploader

end



# customer -> review -> hairdresser
# hairdresser -> reviews -> customers

# class Customer < User
#   has_many :reviews
#   has_many :hairdressers, through: :reviews
# end

# @hairdresser.reviews.create(body: "Good haircut", customer: current_user)
	
# class Hairdresser < User
#   has_many :reviews
#   has_many :hairdressers, through: :reviews
# end

# User.create
#   id: 5
#   type: "User"

# Hairdresser.create
#   id: 6
#   type: "Hairdresser"

