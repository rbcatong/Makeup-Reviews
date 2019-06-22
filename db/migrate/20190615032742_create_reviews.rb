class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :makeup_id
      t.integer :user_id
      t.integer :rating
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
