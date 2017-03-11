class AddSizesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sizes, :text, default: ""
  end
end
