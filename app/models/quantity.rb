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

class Quantity < ApplicationRecord
	extend Enumerize

  enumerize :unit, in: {kilo:1, piece:2}, scope: true

  belongs_to :product
  self.inheritance_column = :quantity_type

  scope :incoming_stores, -> { where(quantity_type: 'IncomingStore') }
  scope :outbounds, -> { where(quantity_type: 'Outbound') }
  scope :returns, -> { where(quantity_type: 'Return') }


  def self.quantity_types
    %w(IncomingStore Outbound Return)
  end
end

class IncomingStore < Quantity
	rails_admin do 
		edit do 
			configure :quantity_type do 
				hide
			end
		end
	end
end
class Outbound < Quantity; end
class Return < Quantity; end
