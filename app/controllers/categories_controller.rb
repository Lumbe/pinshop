class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.friendly.find(params[:id])
    respond_to do |format|
      format.html { @products = @category.products.includes(:category).order(created_at: :desc).per_page_kaminari(params[:page]).per(6) }
      format.js do
        @products = @category.products.includes(:category).filter(params.slice(:brand)).order(created_at: :desc).per_page_kaminari(params[:page]).per(6)
        @products = @products.where(price: params[:min_price]..params[:max_price]).order(created_at: :desc).per_page_kaminari(params[:page]).per(6) if params[:min_price] && params[:max_price]
      end
    end
  end
end
