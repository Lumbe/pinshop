class AddAttachmentWaybillToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.attachment :waybill
    end
  end

  def self.down
    remove_attachment :orders, :waybill
  end
end
