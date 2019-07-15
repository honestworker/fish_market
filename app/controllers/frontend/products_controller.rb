class Frontend::ProductsController < ApplicationController

  def index
    @sliders = Slider.all
    @products = Product.all
    @categories = Category.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.friendly.find(params[:id])
    @products = Product.where(category_id: @product.category.id).where.not(id: @product.id)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @book }
    end

  end

end