class AddAttachmentSizeChartToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :size_chart
    end
  end

  def self.down
    remove_attachment :products, :size_chart
  end
end
