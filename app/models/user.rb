class User < ApplicationRecord
  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_many :searches

  has_secure_password
end
