class Makeup < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :category, presence: true
  validates :purpose, presence: true

end
