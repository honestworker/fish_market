class Frontend::CartsController < ApplicationController
  def show
    redirect_to order_status_cart_path unless current_order.status.cart?
    @order_items = current_order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.destroy_all
    redirect_to cart_url
  end

  def checkout_order
    if current_order.total.to_i >= 100
      redirect_to complete_order_cart_path
    else
      redirect_to cart_path, flash: { error: t('total_greater_than_100') }
    end
  end

  def complete_order

  end

  def order_status
    if request.post?
      status = current_order.update(order_params)
      status && current_order.update_attributes(status: 1)
      redirect_to order_status_cart_path
    end
  end

  def send_order
    session[:order_id] = nil
    redirect_to frontend_root_path
  end

  private

  def order_info_params
    params.require(:order_info).permit(:address, :phone_number, :name)
  end

  def order_params
    params.require(:order).permit(:notes, :address_lat, :address_long, :address, :user_full_name, :user_phone_number, :quantity, :product_id)
  end

end
