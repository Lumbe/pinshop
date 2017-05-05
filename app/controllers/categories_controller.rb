class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.friendly.find(params[:id])
    respond_to do |format|
      format.html do
        @products = @category.products.includes(:category).filter(params.slice(:brand)).order(created_at: :desc).per_page_kaminari(params[:page]).per(9)
      end
      format.js do
        @products = @category.products.includes(:category).filter(params.slice(:brand)).order(created_at: :desc).per_page_kaminari(params[:page]).per(9)
        @products = @products.where(price: params[:min_price]..params[:max_price]).order(created_at: :desc).per_page_kaminari(params[:page]).per(9) if params[:min_price] && params[:max_price]
      end
    end
  end
end
