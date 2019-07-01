class User < ApplicationRecord
  has_many :reviews
  has_many :makeups, through: :reviews

  has_secure_password
  validates :username, presence: true, uniqueness: true

  def self.add_points
    #everytime someone adds a review, they get a point.
    if self.reviews.count += 1
      byebug
      self.points += 1
    end
  end

end
