class RemoveRecommendationFromMakeups < ActiveRecord::Migration[5.2]
  def change
    remove_column :makeups, :recommendation, :boolean
  end
end
