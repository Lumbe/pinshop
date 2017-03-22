# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
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

  def total_items
    line_items.map(&:quantity).sum
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
end
