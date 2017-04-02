class HomeController < ApplicationController
  def index
    @trend_products = Category.find(16).products.order(created_at: :desc).limit(8)
    @trend_products_female = Product.all.select { |product| product.gender == 'female' }
    @new_products = Category.find(18).products.order(created_at: :desc).limit(8)
    @new_products_female = Product.all.select { |product| product.gender == 'female' }
    @sale_products = Product.where.not(old_price: nil)
  end

  def delivery
    render 'pages/delivery'
  end

  def discount
    @discount_products = Product.where.not(old_price: nil)
    render 'pages/discount'
  end

  def wholesale
    render 'pages/wholesale'
  end

  def contacts
    render 'pages/contacts'
  end
end
