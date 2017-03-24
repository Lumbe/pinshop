class AddGenderToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :gender, :integer, default: 1
  end
end
