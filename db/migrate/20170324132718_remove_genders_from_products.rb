class RemoveGendersFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :genders, :string
  end
end
