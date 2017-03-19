class HomeController < ApplicationController
  def index
    @trend_products = Category.find(16).products.order(created_at: :desc).limit(8)
    @trend_products_female = Product.all.select { |product| product.genders.include? 'female' }
    @new_products = Category.find(18).products.order(created_at: :desc).limit(8)
    @new_products_female = Product.all.select { |product| product.genders.include? 'female' }
    @sale_products = Product.where.not(old_price: nil)
  end
end
