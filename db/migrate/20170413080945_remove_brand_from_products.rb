class RemoveBrandFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :brand, :string
  end
end
