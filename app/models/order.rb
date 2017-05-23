# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  email      :string
#  city       :string
#  warehouse  :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#  status     :integer          default("newly")
#  token      :string
#

class Order < ApplicationRecord
  include Calculator

  enum pay_type: {
    'on_delivery' => 0,
    'prepay' => 1
  }

  enum status: {
    'newly' => 0,
    'sent' => 1,
    'sold' => 2,
    'returned' => 3,
    'rejected' => 4
  }

  has_secure_token
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :line_items

  validates :name, :phone, :city, :warehouse, presence: true
  validates :pay_type, inclusion: pay_types.keys

  after_commit :remove_line_items_from_cart, on: :create

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      line_items << item
    end
  end

  def remove_line_items_from_cart
    line_items.update(cart_id: nil)
  end

  def regenerate_token
    update token: SecureRandom::base58(24)
  end
end
