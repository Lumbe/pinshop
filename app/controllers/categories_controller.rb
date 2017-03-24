class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.friendly.find(params[:id])
    @products = @category.products.includes(:category).filter(params.slice(:brand, :sizes))
    @products = @products.where(price: params[:min_price]..params[:max_price]) if params[:min_price] && params[:max_price]
  end
end
