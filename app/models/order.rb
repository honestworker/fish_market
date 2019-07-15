# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  subtotal          :decimal(, )      default(0.0)
#  tax               :decimal(, )      default(0.0)
#  total             :decimal(, )      default(0.0)
#  order_status_id   :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  status            :string           default("cart")
#  user_phone_number :string
#  address           :string
#  address_long      :decimal(, )      default(0.0)
#  address_lat       :decimal(, )      default(0.0)
#  user_full_name    :string
#  notes             :text
#  address_url       :string
#

class Order < ApplicationRecord
  extend Enumerize

  STATUS_CART = 0
  STATUS_PENDING = 1
  STATUS_COOKING = 2
  STATUS_ON_THE_WAY = 3
  STATUS_COMPLETED = 4

  enumerize :status, in: {cart: 0, pending: 1, preparing: 2, on_the_way: 3, completed: 4}, scope: true

  ### ASSOCIATIONS
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_one :order_info, dependent: :destroy


  ### CALL BACKS
  before_save :update_subtotal


  ### Validations
  validates :tax, :subtotal, numericality: true
  validates :total, numericality: { greater_than: 100 }, if: :not_cart?

  def not_cart?
    status != 0
  end

  scope :last_incomplete_order, -> {where.not(status: 'delivered').last}

  rails_admin do
    configure :order_status_id do
      visible false
    end
    configure :address_long do
      visible false
    end
    configure :address_lat do
      visible false
    end
    edit do
      configure :print do
        partial "my_awesome_partial", :locals => { :order => self }
      end
      configure :subtotal do
        help ''
        read_only true
      end
      configure :tax do
        help ''
        read_only true
      end
      configure :total do
        help ''
        read_only true
      end
      configure :status do
        help ''
      end
      configure :order_items do
        read_only true
        help ''
      end
      configure :user do
        visible false
      end
      configure :updated_at do
        visible false
      end
      configure :created_at do
        visible false
      end
    end
  end

  def print
  end

  def calculate_subtotal
    order_items.collect {|oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0.0}.sum
  end

  def self.last_incomplete_order user_id
    user = User.includes(:orders).find(user_id)
    last_order = user.orders.last
    if last_order.present?
      if last_order.status.completed?
        user.orders.create(tax: 0, total: 0)
      else
        return last_order
      end
    else
      user.orders.create(tax: 0, total: 0)
    end
  end

  def build_or_update_order_info(params)
    result = new_record? ? build_order_info(params) : order_info.update_attributes(params)
    result != false
  end

  def update_subtotal
    self[:subtotal] = calculate_subtotal
    self[:tax] = subtotal * 0.05
    self[:total] = subtotal + self[:tax]
  end

  def populate_address_url
    self.update(address_url: "https://www.google.com/maps/search/?api=1&query=#{address_lat},#{address_long}")
  end
end
