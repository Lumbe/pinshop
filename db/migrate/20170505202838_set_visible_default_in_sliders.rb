class SetVisibleDefaultInSliders < ActiveRecord::Migration[5.0]
  def change
    change_column :sliders, :visible, :boolean, default: true
  end
end
