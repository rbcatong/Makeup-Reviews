class CreateMakeups < ActiveRecord::Migration[5.2]
  def change
    create_table :makeups do |t|
      t.string :name
      t.string :purpose
      t.boolean :waterproof
      t.integer :user_id
      t.timestamps
    end
  end
end
