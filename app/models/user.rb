class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_makeups, through: :reviews, source: :makeup
  has_many :makeups
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
