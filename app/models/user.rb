class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reviews
  has_many :hairdressers, through: :reviews
  
  validates :password, length: {minimum: 3}
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  mount_uploader :picture, UserImageUploader

end


	