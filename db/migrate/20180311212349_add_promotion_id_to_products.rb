class AddPromotionIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :promotion_piece_price, :decimal, default: 0
    add_column :products, :promotion_kilo_price, :decimal, default: 0
  end
end
