class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  helper_method :current_order, :first_category

  def current_order
    session[:order_id] = nil unless Order.find_by(id: session[:order_id])
    if !session[:order_id].nil?
      order = Order.find(session[:order_id])
      order = Order.new if order.status.completed?
      order
    else
      Order.new
    end
  end

  def first_category
    cat = Category.first()
    category_id = cat.id
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  # def current_or_guest_user
  #   if current_user
  #     if session[:guest_user_id] && session[:guest_user_id] != current_user.id
  #       logging_in
  #       # reload guest_user to prevent caching problems before destruction
  #       guest_user(with_retry = false).try(:reload).try(:destroy)
  #       session[:guest_user_id] = nil
  #     end
  #     current_user
  #   else
  #     guest_user
  #   end
  # end

  # find guest_user object associated with the current session,
  # creating one as needed
  # def guest_user(with_retry = true)
  #   # Cache the value the first time it's gotten.
  #   @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  # rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
  #    session[:guest_user_id] = nil
  #    guest_user if with_retry
  # end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  # def logging_in
  #   orders = guest_user.orders.all
  #   orders.each do |order|
  #   	order.user_id = current_user.id
  #   	order.save!
  #   end
  # end

  # def create_guest_user
  #   u = User.new(user_name: "guest", mobile_number: Faker::PhoneNumber.cell_phone, email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
  #   u.save!(validate: false)
  #   session[:guest_user_id] = u.id
  #   u
  # end
end
