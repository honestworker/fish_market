module Api
  class V1::OrderItemsController < Api::BaseController
    before_action :authenticate_with_token!

    def create
      @order = current_order
      @order_item = @order.order_items.new(order_item_params)
      @order.save!
      session[:order_id] = @order.id
    end

    def create_or_update
      @order = Order.last_incomplete_order current_user.id
      order_item = @order.order_items.find_by(product_id: order_item_params[:product_id], quantity_type: order_item_params[:quantity_type])
      if !order_item.present?
        @order.order_items.create(order_item_params)
        @message = t(:created_successfully)
      else
        if order_item.quantity_type == order_item_params[:quantity_type]
          order_item.update(quantity: order_item.quantity + order_item_params[:quantity])
        else
          @order.order_items.create(order_item_params)
        end
        @message = t(:updated_successfully)
      end
      if @order.errors.empty?
        @status = 'success'
        render 'api/v1/orders/show'
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def update
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      @order_item.update_attributes(order_item_params)
      @order_items = @order.order_items
    end

    def destroy
      @order = Order.last_incomplete_order current_user.id
      @order_item = @order.order_items.find(params[:id])
      @order_item.destroy
      @status = 'success'
      @message = t(:deleted_successfully)
      if @order_item.destroy
        render 'api/v1/orders/show'
      else
        render json: {status: 'fail', data: @order, message: @order_item.errors.full_messages.first }
      end
    end

    private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :order_id, :quantity_type)
    end
  end
end
