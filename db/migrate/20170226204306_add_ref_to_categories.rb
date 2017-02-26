class AddRefToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :parent_category, index: true, foreign_key: { to_table: :categories }
  end
end
