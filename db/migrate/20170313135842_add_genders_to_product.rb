class AddGendersToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :genders, :string
  end
end
