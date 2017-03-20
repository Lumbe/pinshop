class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :city
      t.string :warehouse
      t.integer :pay_type

      t.timestamps
    end
  end
end
