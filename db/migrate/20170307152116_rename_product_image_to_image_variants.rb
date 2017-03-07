class RenameProductImageToImageVariants < ActiveRecord::Migration[5.0]
  def change
    rename_table :product_images, :image_variants
  end
end
