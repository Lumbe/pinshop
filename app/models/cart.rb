# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  include Calculator

  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items

  def add_item(item)
    current_item = line_items.find_by(product_id: item.product.id, size: item.size)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item.attributes)
    end
    current_item
  end

end
