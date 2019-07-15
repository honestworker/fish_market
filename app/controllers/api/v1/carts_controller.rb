module Api
  class V1::CartsController < Api::BaseController
    def show
      @order_items = current_order.order_items
    end
  end
end
