class AddTrendingToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :trending, :boolean, default: false
  end
end
