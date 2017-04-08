class HomeController < ApplicationController
  def index
    @trend_products = Product.trending_products.order(created_at: :desc)
    @trend_products_female = Product.all.select { |product| product.gender == 'female' }
    @new_products = Product.novelty_products.order(created_at: :desc)
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

  def mail
    respond_to do |format|
      format.html
      format.js do
        MessageMailer.send_mail(params[:email], params[:message]).deliver
      end
    end
  end

  def search
    @search_products = Product.ransack(name_cont: params[:search]).result
    @products = @search_products.per_page_kaminari(params[:page]).per(8)
    render 'home/search'
  end
end
