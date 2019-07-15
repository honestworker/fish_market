# == Schema Information
#
# Table name: quantities
#
#  id            :integer          not null, primary key
#  quantity      :decimal(, )      default(0.0)
#  unit          :string           default(NULL)
#  quantity_type :string
#  product_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class QuantityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
