# == Schema Information
#
# Table name: products
#
#  id                    :integer          not null, primary key
#  name                  :string
#  piece_price           :decimal(15, 2)   default(0.0)
#  kilo_price            :decimal(15, 2)   default(0.0)
#  category_id           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  active                :boolean
#  desc                  :text
#  promotion_piece_price :decimal(, )      default(0.0)
#  promotion_kilo_price  :decimal(, )      default(0.0)
#  slug                  :string
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
