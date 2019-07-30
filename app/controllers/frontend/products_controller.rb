class Frontend::ProductsController < ApplicationController

  def index
    @sliders = Slider.all
    @categories = Category.all
    if params[:category_id].to_i.to_s ==  params[:category_id] && params[:category_id].to_i > 0
      @products = Product.where(category_id: params[:category_id])
    else
      @products = Product.all
    end
    @current_category = params[:category_id].to_i
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.where(category_id: @product.category.id).where.not(id: @product.id)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @book }
    end
  end

end