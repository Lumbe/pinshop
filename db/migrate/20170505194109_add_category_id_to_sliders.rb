class AddCategoryIdToSliders < ActiveRecord::Migration[5.0]
  def change
    add_column :sliders, :category_id, :integer
  end
end
