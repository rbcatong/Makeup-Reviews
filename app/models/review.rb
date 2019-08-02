class Review < ApplicationRecord
  belongs_to :user
  belongs_to :makeup

  scope :top_reviews, -> {Review.where("rating = 5")}


  validates :title, presence: true

  validates :content,
  presence: true,
  length: {minimum: 20},
  allow_nil: false

  def recommendation_name
    if self.recommendation == true
      return "Yes"
    else
      return "No"
    end
  end


    def self.averageproducts
      self.average(:rating).to_f
    end





end
