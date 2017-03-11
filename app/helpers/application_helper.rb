module ApplicationHelper

  def discount(old_price, new_price)
    discount_amount = old_price - new_price
    discount_percent = discount_amount*100/old_price
    "Скидка: #{number_to_currency(discount_amount, precision: 0, locale: :uk)} (#{number_to_percentage(discount_percent, precision: 0)})"
  end

  def percent_discount(product)
    discount = (product.old_price - product.price)*100/product.old_price
    number_to_percentage(discount, precision: 0)
  end
end
