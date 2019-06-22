class CreateMakeups < ActiveRecord::Migration[5.2]
  def change
    create_table :makeups do |t|
      t.string :name
      t.string :purpose
      t.boolean :waterproof
      t.timestamps
    end
  end
end
