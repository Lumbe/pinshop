class AddNoveltyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :novelty_to, :date
  end
end
