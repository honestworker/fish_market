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

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
