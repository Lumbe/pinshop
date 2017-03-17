class AddSizeToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :size, :string
  end
end
