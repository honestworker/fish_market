module Api
  class V1::ProductsController < Api::BaseController
    before_action :set_product, only: [:show]
    respond_to :json

    def show
    end

    def promotions
      page_size = params[:page_size]
      @q = Product.promotionable.ransack(params[:q])
      @q.sorts = 'created_at' if @q.sorts.empty?

      @products = @q.result
      @products = @products.page(params[:page])
      @products = @products.per(page_size) if !page_size.blank?
      @status = 'success'
      render :index
    end

    def services
      page_size = params[:page_size]
      @q = OtherService.all.ransack
      @services = @q.result
      @services = @services.page(params[:page])
      @services = @services.per(page_size) unless page_size.blank?
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
  end
end
