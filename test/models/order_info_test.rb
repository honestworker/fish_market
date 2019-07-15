# == Schema Information
#
# Table name: order_infos
#
#  id           :integer          not null, primary key
#  address      :text
#  phone_number :string
#  name         :string
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class OrderInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
