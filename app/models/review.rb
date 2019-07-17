class Review < ApplicationRecord
  belongs_to :user
  belongs_to :makeup
  scope :top_reviews, -> {Review.where("rating = 5")}

  validates :content,
  presence: true,
  length: {minimum: 20},
  on: :create,
  allow_nil: false

  def recommendation_name
    if self.recommendation == true
      return "Yes"
    else
      return "No"
    end
  end

end
