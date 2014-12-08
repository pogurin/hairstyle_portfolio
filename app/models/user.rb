class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reviews
  has_many :hairdressers, through: :reviews
  
  validates :password, length: {minimum: 3}, on: :create 
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true, on: :create

  mount_uploader :picture, UserImageUploader

end


	