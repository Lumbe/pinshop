class ChangeProductSizesTypeToText < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :sizes, :string, array: true, default: '{}'
  end
end
