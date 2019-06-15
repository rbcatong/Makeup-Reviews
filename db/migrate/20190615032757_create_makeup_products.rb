class CreateMakeupProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :makeup_products do |t|

      t.timestamps
    end
  end
end
