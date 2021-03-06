class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 },
   #                 format: { with: VALID_EMAIL_REGEX },
    #                uniqueness: true
  has_many :activities, dependent: :destroy
  has_secure_password
  has_many :comments, dependent: :destroy
end
