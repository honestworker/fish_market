module Api
  module V1
    class HomeController < Api::BaseController
      def index
        page_size = params[:page_size]
        @q = Product.ransack(params[:q])
        @q.sorts = 'created_at' if @q.sorts.empty?

        @products = @q.result
        @products = @products.page(params[:page])
        @products = @products.per(page_size) if !page_size.blank?
      end
    end
  end
end