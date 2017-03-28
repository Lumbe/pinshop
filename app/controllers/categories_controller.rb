class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.friendly.find(params[:id])
    @products = @category.products.includes(:category).filter(params.slice(:brand))
    respond_to do |format|
      format.html
      format.js do
        @products = @category.products.includes(:category).filter(params.slice(:brand))
        @products = @products.where(price: params[:min_price]..params[:max_price]) if params[:min_price] && params[:max_price]
      end
    end
  end
end
