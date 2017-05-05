class AddBrandIdToSliders < ActiveRecord::Migration[5.0]
  def change
    add_column :sliders, :brand_id, :integer, array: true, default: []
  end
end
