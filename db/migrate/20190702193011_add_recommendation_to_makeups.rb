class AddRecommendationToMakeups < ActiveRecord::Migration[5.2]
  def change
    add_column :makeups, :recommendation, :boolean
  end
end
