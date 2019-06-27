class User < ApplicationRecord
  has_many :reviews
  has_many :makeups, through: :reviews
  
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
