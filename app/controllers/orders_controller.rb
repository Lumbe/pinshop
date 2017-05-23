class OrdersController < ApplicationController
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @warehouses ||= []

    respond_to do |format|
      format.html
      format.json do
          @warehouses = Novaposhta2::City.find(params[:city]).warehouses if params[:city] && !params[:city].blank?
          render json: @warehouses
      end
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        MessageMailer.order_notification(@order)
        format.html
        format.js
      else
        render :new
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  def status
    token = params['token']
    order_token = token[0..23]
    @order = Order.find_by(token: order_token)

    if @order
      @order.regenerate_token
      case params[:status]
      when 'sent'
        @order.sent!
        MessageMailer.order_notification(@order)
      when 'rejected'
        @order.rejected!
        MessageMailer.order_notification(@order)
      when 'sold'
        @order.sold!
        MessageMailer.order_notification(@order)
      when 'returned'
        @order.returned!
        MessageMailer.order_notification(@order)
      end
    else
      redirect_to order_status_error_url
    end
  end

  def status_error
  end

  def thank_you
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js {redirect_to root_url}
    end
  end

  private

  def auth_user
    if request.get? && !params[:token].blank?
      token = params[:token]
      user_id = token[24..-1]
      user = User.find(user_id)
      if user && Devise.secure_compare(user.authenticatable_salt, params[:user_token])
        sign_in user, store: false
      end
    end
  end

  def ensure_cart_isnt_empty
    if @cart.line_items.empty?
      redirect_to root_url, notice: 'Добавьте товары в корзину'
    end
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:name, :phone, :email, :city, :warehouse, :pay_type, :comment, line_items_attributes: [:id, :quantity])
  end
end
