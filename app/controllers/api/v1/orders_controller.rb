module Api
  class V1::OrdersController < Api::BaseController
    before_action :authenticate_with_token!
    before_action :set_order, only: [:show, :update, :update_order_items, :destroy]

    def index
      page_size = params[:page_size]
      @q = current_user.orders.ransack(params[:q])
      @q.sorts = 'created_at' if @q.sorts.empty?
      @orders = @q.result
      @orders = @orders.page(params[:page])
      @orders = @orders.per(page_size) if !page_size.blank?
      @status = 'success'
    end

    def show
    end

    def destroy
      if @order
        if @order.destroy
          render json: {message: t('deleted_successfully'), status: 'success'}
        else
          render json: {message: @order.errors.full_messages, status: 'fail'}
        end
      else
        render json: {message: "Order not found", status: 'fail'}
      end

    end

    def update_order_items
      # render json:{status: 400, message: 'not authorized'} && return if current_user != @order.user
      ActiveRecord::Base.transaction do
        order_items_params.to_hash['order_items'].each do |order_item_param|
          order_item = @order.order_items.find_by(id: order_item_param['id'])
          if order_item.present?
            order_item.update(quantity: order_item_param['quantity'])
          else
            render json: {message: "wrong id of line item #{order_item_param['id']}", status: 422}
            return
          end
        end
      end
      @status = 'success'
      @message = t(:updated_successfully)
      render :show
    end

    def last_incomplete_order
      @order = Order.last_incomplete_order current_user.id
      # @order = Order.last_incomplete_order current_user.id
      if @order.present?
        @status = 'success'
        render :show
      else
        render json: {status: 'fail', message: t(:not_found), data: nil}
      end
    end

    def create
      @order = Order.create(user_id: current_user.id)
      render :show
    end

    def update
      @order.status = Order::STATUS_PENDING
      if current_user.access_locked?
        if current_user.update(mobile_number: order_params[:user_phone_number])
          current_user.lock_user
          render json: {status: 'fail', code: 1, message: t(:verify_your_account), data: nil}
        else
          render json: {status: 'fail', code: 1, message: current_user.errors.full_messages.first, data: nil}
        end
      else
        if @order.update(order_params)
          @order.populate_address_url
          @status = 'success'
          @message = t(:updated_successfully)
          render :show
        else
          @status = 'fail'
          @message = @order.errors.full_messages.first
          render :show
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by(id: params[:id])
    end

    def order_items_params
      params.require(:order).permit(order_items: [:id, :quantity, :quantity_type])
    end

    def order_params
      params.require(:order).permit(:notes, :address_lat, :address_long, :address, :user_full_name, :user_phone_number, :quantity, :product_id)
    end
  end
end