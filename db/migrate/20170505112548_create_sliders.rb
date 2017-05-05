class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.boolean :visible

      t.timestamps
    end
  end
end
