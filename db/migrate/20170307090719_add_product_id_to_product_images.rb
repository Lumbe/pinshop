class AddProductIdToProductImages < ActiveRecord::Migration[5.0]
  def change
    add_column :product_images, :product_id, :integer
  end
end
