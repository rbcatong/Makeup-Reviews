class Review < ApplicationRecord
  def index
    @reviews = Review.all
  end
end
