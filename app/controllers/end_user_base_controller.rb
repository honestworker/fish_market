class EndUserBaseController < ApplicationController
  before_action :authenticate_user!
end
