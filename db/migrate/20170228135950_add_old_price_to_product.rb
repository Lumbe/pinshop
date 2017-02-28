class AddOldPriceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :old_price, :decimal, precision: 8, scale: 2
  end
end
