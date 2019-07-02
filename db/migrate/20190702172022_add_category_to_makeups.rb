class AddCategoryToMakeups < ActiveRecord::Migration[5.2]
  def change
    add_column :makeups, :category, :string
  end
end
