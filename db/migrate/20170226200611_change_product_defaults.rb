class ChangeProductDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :decimal, precision: 8, scale: 2
    change_column :products, :name, :string, default: ""
    change_column :products, :description, :text, default: ""
  end
end
