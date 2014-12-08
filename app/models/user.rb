class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # validates :password, length: {minimum: 3}
  validates :password, confirmation: true, on: :create
  # validates :password_confirmation, presence: true
  # validates :email, uniqueness: true

  mount_uploader :picture, UserImageUploader

end


	