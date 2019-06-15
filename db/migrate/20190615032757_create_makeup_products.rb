class CreateMakeupProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :makeup_products do |t|
      t.string :name
      t.string :purpose
      t.boolean :waterproof
      t.timestamps
    end
  end
end
