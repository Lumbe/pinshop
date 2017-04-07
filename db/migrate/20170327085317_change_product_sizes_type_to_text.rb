class ChangeProductSizesTypeToText < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :sizes, :text, default: ""
    add_column :products, :sizes, :string, array: true, default: []
  end

  def down
    remove_column :products, :sizes, :string, array: true, default: []
    add_column :products, :sizes, :text, default: ""
  end
end
