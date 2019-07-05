require 'pry'
class User < ApplicationRecord
  has_many :reviews
  has_many :makeups, through: :reviews

  has_secure_password
  validates :username, presence: true, uniqueness: true


  # def self.status_update
  #     @user.increment(:points, 10)
  #     if user has number points - change status
  # end

  # scope method
  # def self.point_level
  # where(:points > 100)
  # end
  # #display users with 100 points.

end

# routes.rb
# get '/inflencers' "users#define_the_action"
#
# users_controller
# def defined_action
# end
