class Frontend::OrderItemsController < ApplicationController
  def create
    @order = current_order
    @status_error = []
    @order_item = @order.order_items.new(order_item_params)
    if @order.status == 0 && @order.save
      redirect_to cart_url
      session[:order_id] = @order.id
    else
      @status_error.push(t('wait_your_order_to_finish')) if @order.status != 0
      redirect_to product_path(@order_item.product_id), flash: { error: @order.errors.full_messages + @order_item.errors.full_messages + @status_error }
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_to cart_url
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to cart_url
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :quantity_type, :slicing_type)
  end

end
