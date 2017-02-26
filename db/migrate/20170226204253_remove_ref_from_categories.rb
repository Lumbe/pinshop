class RemoveRefFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_reference :categories, :category
  end
end
