module Api
  module V1
    class CitiesController < Api::BaseController

      def index
        @cities  = City.all
        render json: { data: @cities, status: 'success'}
      end
    end
  end
end