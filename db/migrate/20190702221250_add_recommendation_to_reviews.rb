class AddRecommendationToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :recommendation, :boolean
  end
end
