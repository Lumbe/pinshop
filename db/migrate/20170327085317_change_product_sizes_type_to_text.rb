class ChangeProductSizesTypeToText < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :sizes, "USING sizes::character varying[]", default: '{}'
  end
end
