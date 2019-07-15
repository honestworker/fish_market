class Frontend::HomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    @products = Product.all
    @categories = Category.all
    # @other_servers = Product.unscoped.all.joins(:category).merge(Category.where(name: "other_servers"))
  end

  def other_services
    @services = OtherService.all
  end
end
