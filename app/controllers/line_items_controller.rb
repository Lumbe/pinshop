class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  def create
    line_item = LineItem.new(line_item_params)
    @line_item = @cart.add_item(line_item)
    respond_to do |format|
      if @line_item.save
        format.html {redirect_back fallback_location: root_url}
        format.js
        format.json {render :show, status: :created, location: @line_item}
      else
        format.html {render :new}
        format.json {render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /line_items/1
  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html {redirect_back fallback_location: root_url}
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity, :size)
    end
end
