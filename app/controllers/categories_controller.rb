class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.friendly.find(params[:id])
    @products = @category.products.includes(:category)
  end
end
