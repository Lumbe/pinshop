class CartsController < ApplicationController
  before_action :set_user_cart, only: [:show, :edit, :update, :destroy]
  before_action :ensure_proper_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html {redirect_back fallback_location: root_url}
      format.json {head :no_content}
    end
  end

  def invalid_cart
    logger.error "Попытка доступа к недействительной или чужой корзине #{params[:id]}"
    render 'shared/invalid_cart'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.fetch(:cart, {})
    end

    def ensure_proper_cart
      if @cart.id != session[:cart_id]
        redirect_to :invalid_cart if @cart.id != session[:cart_id]
      end
    end

end
