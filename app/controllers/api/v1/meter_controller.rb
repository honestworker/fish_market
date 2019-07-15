module Api
  module V1
    class MeterController < Api::BaseController
      def percentage
        @meter = Meter.last
        render json: { data: @meter, status: 'success'}
      end
    end
  end
end