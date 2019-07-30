# == Schema Information
#
# Table name: order_items
#
#  id            :integer          not null, primary key
#  product_id    :integer
#  order_id      :integer
#  unit_price    :decimal(15, 2)   default(0.0)
#  quantity      :integer          default(1)
#  total_price   :decimal(15, 2)   default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  quantity_type :string           default("piece")
#  slicing_type  :string           default("clean")
#

class OrderItem < ApplicationRecord
  extend Enumerize
  belongs_to :product
  belongs_to :order

  enumerize :slicing_type, in: {clean: 0, with_out_clean: 1, sengary: 2}
  enumerize :quantity_type, in: {kilo: 0, piece: 1}
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates_uniqueness_of :product_id, scope: [:order_id, :quantity_type]
  validate :product_present
  validate :order_present

  before_save :finalize
  after_save :update_order_total
  after_destroy :update_order_total

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.kilo_price
    end
  end

  def total_price
    unit_price * quantity
  end

  def name
    (quantity.to_s || '') + ' من ' + (product.try(:name) || '')
  end

  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    set_unit_price
    self.total_price = quantity * unit_price
  end

  def set_unit_price
    self.unit_price = quantity_type.kilo? ? product.kilo_price : product.piece_price
  end

  def update_order_total
    new_subtotal = order.calculate_subtotal
    #order.update(subtotal: new_subtotal, tax: new_subtotal * 0.05, total: (new_subtotal *0.05) + new_subtotal )
    order.update(subtotal: new_subtotal, tax: new_subtotal * 0.05, delivery: 25, total: 25 + new_subtotal )
  end
end
