module Api
  module V1
    class SlidersController < Api::BaseController
      def index
        page_size = params[:page_size]
        @q = Slider.ransack(params[:q])
        @q.sorts = 'created_at' if @q.sorts.empty?
        @status = "success"
        @sliders = @q.result
        @sliders = @sliders.page(params[:page])
        @sliders = @sliders.per(page_size) if !page_size.blank?
      end
    end
  end
end