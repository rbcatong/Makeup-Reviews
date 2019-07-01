class AddHelpfulToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :helpful, :boolean
  end
end
