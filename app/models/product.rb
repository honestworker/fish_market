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

class Product < ApplicationRecord
  extend Enumerize
  translates :name, :desc

  extend FriendlyId
  friendly_id :name, use: :slugged

  ### ASSOCIATIONS ####
  belongs_to :category, optional: true
  has_many :order_items
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, :allow_destroy => true
  has_many :quantities
  delegate :incoming_stores, :outbounds, :returns, to: :quantities
  enumerize :quantity_type, in: {kilo: 0, piece: 1}, scope: true

  attr_accessor :qy

  scope :promotionable, -> {where.not(promotion_piece_price: 0).where.not(promotion_kilo_price: 0)}

  rails_admin do
    configure :name do
      tabbed true
    end
    configure :desc do
      tabbed true
    end
    configure :order_items do
      visible false
    end
    configure :quantities do
      visible false
    end
    configure :active do
      visible false
    end
    configure :name do
      tabbed true
    end
    configure :desc do
      tabbed true
    end

    list do
      field :name
      field :piece_price
      field :kilo_price
      field :category
      field :promotion_kilo_price
      field :promotion_piece_price
    end
  end

  def get_discount_by_type type, qty
    return 0 if type.nil? || qty.nil?
    if type == 'piece'
      promotion_piece_price * qty
    else
      promotion_kilo_price * qty
    end
  end
end
