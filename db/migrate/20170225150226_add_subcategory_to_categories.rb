class AddSubcategoryToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :category, index: true, foreign_key: { to_table: :categories }
  end
end
