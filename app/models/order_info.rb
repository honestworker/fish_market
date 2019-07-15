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

class OrderInfo < ApplicationRecord
  belongs_to :order
end
