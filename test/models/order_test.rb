# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  subtotal          :decimal(, )      default(0.0)
#  tax               :decimal(, )      default(0.0)
#  delivery          :decimal(, )      default(0.0)
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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
