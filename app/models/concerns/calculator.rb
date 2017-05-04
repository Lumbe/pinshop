module Calculator

  def total_items
    line_items.map(&:quantity).sum
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end

end