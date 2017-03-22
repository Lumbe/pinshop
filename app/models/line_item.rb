# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  size       :string
#  price      :decimal(8, 2)
#  order_id   :integer
#
# Indexes
#
#  index_line_items_on_cart_id     (cart_id)
#  index_line_items_on_order_id    (order_id)
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_11e15d5c6b  (product_id => products.id)
#  fk_rails_2dc2e5c22c  (order_id => orders.id)
#  fk_rails_af645e8e5f  (cart_id => carts.id)
#

class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart

  def total_price
    price * quantity
  end
end
