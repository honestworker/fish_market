class ChangePrecision < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :piece_price, :decimal, precision: 15, scale: 2,default: 0.00
    change_column :products, :kilo_price, :decimal, precision: 15, scale: 2, default: 0.00
    change_column :order_items, :unit_price, :decimal, precision: 15, scale: 2, default: 0.00
    change_column :order_items, :total_price, :decimal, precision: 15, scale: 2, default: 0.00
  end
end
