module Api
  module V1
    class CategoriesController < Api::BaseController
      def index
        page_size = params[:page_size]
        @q = Category.where.not(name: 'خدمتنا الأخري').ransack(params[:q])
        @q.sorts = 'created_at' if @q.sorts.empty?

        @categories = @q.result
        @categories = @categories.page(params[:page])
        @categories = @categories.per(page_size) if !page_size.blank?
      end
    end
  end
end