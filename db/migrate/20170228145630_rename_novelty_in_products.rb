class RenameNoveltyInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :novelty_to, :novelty_expires_at
  end
end
