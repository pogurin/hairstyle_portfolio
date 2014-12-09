class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :hairdressers, through: :reviews

  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 3}, on: :create 
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true, on: :create

  mount_uploader :picture, UserImageUploader

end



	
